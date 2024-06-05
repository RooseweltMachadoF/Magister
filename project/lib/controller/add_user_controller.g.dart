// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddUserSalaController on _AddUserSalaController, Store {
  late final _$salasAtom =
      Atom(name: '_AddUserSalaController.salas', context: context);

  @override
  ObservableList<SalaModel> get salas {
    _$salasAtom.reportRead();
    return super.salas;
  }

  @override
  set salas(ObservableList<SalaModel> value) {
    _$salasAtom.reportWrite(value, super.salas, () {
      super.salas = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AddUserSalaController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_AddUserSalaController.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchSalasAsyncAction =
      AsyncAction('_AddUserSalaController.fetchSalas', context: context);

  @override
  Future<void> fetchSalas() {
    return _$fetchSalasAsyncAction.run(() => super.fetchSalas());
  }

  late final _$addUserToSalaAsyncAction =
      AsyncAction('_AddUserSalaController.addUserToSala', context: context);

  @override
  Future<void> addUserToSala(String salaId, String userEmail) {
    return _$addUserToSalaAsyncAction
        .run(() => super.addUserToSala(salaId, userEmail));
  }

  late final _$deleteSalaAsyncAction =
      AsyncAction('_AddUserSalaController.deleteSala', context: context);

  @override
  Future<void> deleteSala(String salaId) {
    return _$deleteSalaAsyncAction.run(() => super.deleteSala(salaId));
  }

  @override
  String toString() {
    return '''
salas: ${salas},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
