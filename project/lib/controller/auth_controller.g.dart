// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthController, Store {
  late final _$currentUserAtom =
      Atom(name: '_AuthController.currentUser', context: context);

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_AuthController.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_AuthController.signUp', context: context);

  @override
  Future<bool> signUp(String email, String password, String fullName,
      DateTime dateOfBirth, String telefone, String matricula) {
    return _$signUpAsyncAction.run(() => super
        .signUp(email, password, fullName, dateOfBirth, telefone, matricula));
  }

  late final _$signInAsyncAction =
      AsyncAction('_AuthController.signIn', context: context);

  @override
  Future<bool> signIn(String email, String password) {
    return _$signInAsyncAction.run(() => super.signIn(email, password));
  }

  late final _$signOutAsyncAction =
      AsyncAction('_AuthController.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$checkUserPermissionAsyncAction =
      AsyncAction('_AuthController.checkUserPermission', context: context);

  @override
  Future<void> checkUserPermission() {
    return _$checkUserPermissionAsyncAction
        .run(() => super.checkUserPermission());
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
loading: ${loading}
    ''';
  }
}
