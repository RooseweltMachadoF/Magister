import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:project/model/sala_model.dart';

part 'add_user_controller.g.dart';

class AddUserSalaController = _AddUserSalaController
    with _$AddUserSalaController;

abstract class _AddUserSalaController with Store {
  _AddUserSalaController() {
    fetchSalas();
  }
  @observable
  ObservableList<SalaModel> salas = ObservableList<SalaModel>();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> fetchSalas() async {
    isLoading = true;
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('salas').get();
      salas = ObservableList.of(
          snapshot.docs.map((doc) => SalaModel.fromDocument(doc)).toList());
    } catch (e) {
      errorMessage = 'Erro ao buscar salas: $e';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> addUserToSala(String salaId, String userEmail) async {
    isLoading = true;
    errorMessage = '';
    try {
      DocumentReference salaRef =
          FirebaseFirestore.instance.collection('salas').doc(salaId);

      // Check if the sala exists
      DocumentSnapshot salaSnapshot = await salaRef.get();
      if (!salaSnapshot.exists) {
        errorMessage = 'Sala não encontrada';
        isLoading = false;
        return;
      }

      // Add user email to the sala
      await salaRef.update({
        'users': FieldValue.arrayUnion([userEmail])
      });

      isLoading = false;
    } catch (e) {
      errorMessage = 'Erro ao adicionar usuário: $e';
      isLoading = false;
    }
  }

  @action
  Future<void> deleteSala(String salaId) async {
    isLoading = true;
    errorMessage = '';
    try {
      await FirebaseFirestore.instance.collection('salas').doc(salaId).delete();
      await fetchSalas(); // Refresh the list of salas
    } catch (e) {
      errorMessage = 'Erro ao apagar sala: $e';
    } finally {
      isLoading = false;
    }
  }
}
