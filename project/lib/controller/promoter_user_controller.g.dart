// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promoter_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PromoterUserController on _PromoterUserController, Store {
  late final _$usersAtom =
      Atom(name: '_PromoterUserController.users', context: context);

  @override
  ObservableList<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$filteredRoomsAtom =
      Atom(name: '_PromoterUserController.filteredRooms', context: context);

  @override
  ObservableList<UserModel> get filteredRooms {
    _$filteredRoomsAtom.reportRead();
    return super.filteredRooms;
  }

  @override
  set filteredRooms(ObservableList<UserModel> value) {
    _$filteredRoomsAtom.reportWrite(value, super.filteredRooms, () {
      super.filteredRooms = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_PromoterUserController.searchQuery', context: context);

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

  late final _$fetchUsersAsyncAction =
      AsyncAction('_PromoterUserController.fetchUsers', context: context);

  @override
  Future<void> fetchUsers() {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers());
  }

  late final _$updatePermissionAsyncAction =
      AsyncAction('_PromoterUserController.updatePermission', context: context);

  @override
  Future<void> updatePermission(String userId, String newPermission) {
    return _$updatePermissionAsyncAction
        .run(() => super.updatePermission(userId, newPermission));
  }

  late final _$_PromoterUserControllerActionController =
      ActionController(name: '_PromoterUserController', context: context);

  @override
  void filterRooms() {
    final _$actionInfo = _$_PromoterUserControllerActionController.startAction(
        name: '_PromoterUserController.filterRooms');
    try {
      return super.filterRooms();
    } finally {
      _$_PromoterUserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_PromoterUserControllerActionController.startAction(
        name: '_PromoterUserController.setSearchQuery');
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_PromoterUserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
filteredRooms: ${filteredRooms},
searchQuery: ${searchQuery}
    ''';
  }
}
