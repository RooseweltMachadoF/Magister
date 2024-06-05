import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:project/model/sala_model.dart';
part 'my_rooms_controller.g.dart';

class MyRoomsController = _MyRoomsController with _$MyRoomsController;

abstract class _MyRoomsController with Store {
  final String email;

  _MyRoomsController({required this.email}) {
    fetchRooms(email);
  }

  @observable
  ObservableList<SalaModel> rooms = ObservableList<SalaModel>();

  @observable
  ObservableList<SalaModel> filteredRooms = ObservableList<SalaModel>();

  @observable
  String searchQuery = '';

  @action
  Future<void> fetchRooms(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('salas')
          .where('usuarios', arrayContains: email)
          .get();
      rooms = ObservableList.of(querySnapshot.docs
          .map((doc) => SalaModel.fromDocument(doc))
          .toList());
      filterRooms();
    } catch (e) {
      print('Erro ao buscar salas: $e');
    }
  }

  @action
  void filterRooms() {
    if (searchQuery.isEmpty) {
      filteredRooms = ObservableList.of(rooms);
    } else {
      final query = searchQuery.toLowerCase();
      filteredRooms = ObservableList.of(
        rooms
            .where((room) => room.titulo.toLowerCase().contains(query))
            .toList(),
      );
    }
  }

  @action
  void setSearchQuery(String value) {
    searchQuery = value;
    filterRooms();
  }
}
