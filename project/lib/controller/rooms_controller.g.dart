// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RoomsController on _RoomsController, Store {
  late final _$roomsAtom =
      Atom(name: '_RoomsController.rooms', context: context);

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
      Atom(name: '_RoomsController.filteredRooms', context: context);

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
      Atom(name: '_RoomsController.searchQuery', context: context);

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
      AsyncAction('_RoomsController.fetchRooms', context: context);

  @override
  Future<void> fetchRooms() {
    return _$fetchRoomsAsyncAction.run(() => super.fetchRooms());
  }

  late final _$_RoomsControllerActionController =
      ActionController(name: '_RoomsController', context: context);

  @override
  void filterRooms() {
    final _$actionInfo = _$_RoomsControllerActionController.startAction(
        name: '_RoomsController.filterRooms');
    try {
      return super.filterRooms();
    } finally {
      _$_RoomsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_RoomsControllerActionController.startAction(
        name: '_RoomsController.setSearchQuery');
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_RoomsControllerActionController.endAction(_$actionInfo);
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
