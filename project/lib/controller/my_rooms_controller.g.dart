// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_rooms_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyRoomsController on _MyRoomsController, Store {
  late final _$roomsAtom =
      Atom(name: '_MyRoomsController.rooms', context: context);

  @override
  ObservableList<SalaModel> get rooms {
    _$roomsAtom.reportRead();
    return super.rooms;
  }

  @override
  set rooms(ObservableList<SalaModel> value) {
    _$roomsAtom.reportWrite(value, super.rooms, () {
      super.rooms = value;
    });
  }

  late final _$filteredRoomsAtom =
      Atom(name: '_MyRoomsController.filteredRooms', context: context);

  @override
  ObservableList<SalaModel> get filteredRooms {
    _$filteredRoomsAtom.reportRead();
    return super.filteredRooms;
  }

  @override
  set filteredRooms(ObservableList<SalaModel> value) {
    _$filteredRoomsAtom.reportWrite(value, super.filteredRooms, () {
      super.filteredRooms = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_MyRoomsController.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$fetchRoomsAsyncAction =
      AsyncAction('_MyRoomsController.fetchRooms', context: context);

  @override
  Future<void> fetchRooms(String email) {
    return _$fetchRoomsAsyncAction.run(() => super.fetchRooms(email));
  }

  late final _$_MyRoomsControllerActionController =
      ActionController(name: '_MyRoomsController', context: context);

  @override
  void filterRooms() {
    final _$actionInfo = _$_MyRoomsControllerActionController.startAction(
        name: '_MyRoomsController.filterRooms');
    try {
      return super.filterRooms();
    } finally {
      _$_MyRoomsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_MyRoomsControllerActionController.startAction(
        name: '_MyRoomsController.setSearchQuery');
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_MyRoomsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rooms: ${rooms},
filteredRooms: ${filteredRooms},
searchQuery: ${searchQuery}
    ''';
  }
}
