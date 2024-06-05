import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:project/model/sala_model.dart';

part 'rooms_controller.g.dart';

class RoomsController = _RoomsController with _$RoomsController;

abstract class _RoomsController with Store {
  _RoomsController() {
    fetchRooms();
  }

  @observable
  ObservableList<SalaModel> rooms = ObservableList<SalaModel>();

  @observable
  ObservableList<SalaModel> filteredRooms = ObservableList<SalaModel>();

  @observable
  String searchQuery = '';

  @action
  Future<void> fetchRooms() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('salas').get();
      rooms = ObservableList.of(
          snapshot.docs.map((doc) => SalaModel.fromDocument(doc)).toList());
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
