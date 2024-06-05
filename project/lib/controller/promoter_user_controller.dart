import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:project/model/usuario_model.dart';

part 'promoter_user_controller.g.dart';

class PromoterUserController = _PromoterUserController
    with _$PromoterUserController;

abstract class _PromoterUserController with Store {
  _PromoterUserController() {
    fetchUsers();
  }

  @observable
  ObservableList<UserModel> users = ObservableList<UserModel>();

  @observable
  ObservableList<UserModel> filteredRooms = ObservableList<UserModel>();

  @observable
  String searchQuery = '';

  @action
  Future<void> fetchUsers() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').get();
      users = ObservableList.of(
          snapshot.docs.map((doc) => UserModel.fromDocument(doc)).toList());
    } catch (e) {
      print('Erro ao buscar usuários: $e');
    }
  }

  @action
  void filterRooms() {
    if (searchQuery.isEmpty) {
      filteredRooms = ObservableList.of(users);
    } else {
      final query = searchQuery.toLowerCase();
      filteredRooms = ObservableList.of(
        users
            .where((room) => room.email.toLowerCase().contains(query))
            .toList(),
      );
    }
  }

  @action
  Future<void> updatePermission(String userId, String newPermission) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'permission': newPermission});
      final user = users.firstWhere((user) => user.id == userId);
      user.permission = newPermission; // Update local state
    } catch (e) {
      print('Erro ao atualizar permissão: $e');
    }
  }

  @action
  void setSearchQuery(String value) {
    searchQuery = value;
    filterRooms();
  }
}
