import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:project/model/usuario_model.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @observable
  UserModel? currentUser;
  @observable
  bool loading = false;

  @action
  Future<bool> signUp(String email, String password, String fullName,
      DateTime dateOfBirth, String telefone, String matricula) async {
    try {
      loading = true;
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        UserModel newUser = UserModel(
          id: user.uid,
          email: email,
          fullName: fullName,
          permission: 'user', // Permissão padrão
          dateOfBirth: dateOfBirth, telefone: telefone, matricula: matricula,
        );

        await _firestore.collection('users').doc(user.uid).set(newUser.toMap());
        currentUser = newUser;
        loading = false;

        return true;
      }
      loading = false;

      return false;
    } catch (e) {
      print('Erro ao cadastrar usuário: $e');
      loading = false;

      return false;
    }
  }

  @action
  Future<bool> signIn(String email, String password) async {
    try {
      loading = true;

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        currentUser = UserModel.fromDocument(userDoc);
        loading = false;

        return true;
      }
      loading = false;

      return false;
    } catch (e) {
      print('Erro ao fazer login: $e');
      loading = false;

      return false;
    }
  }

  @action
  Future<void> signOut() async {
    await _auth.signOut();
    currentUser = null;
  }

  @action
  Future<void> checkUserPermission() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      currentUser = UserModel.fromDocument(userDoc);
    }
  }
}
