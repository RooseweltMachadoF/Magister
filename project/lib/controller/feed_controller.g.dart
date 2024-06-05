// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedController on _FeedController, Store {
  late final _$imageAtom =
      Atom(name: '_FeedController.image', context: context);

  @override
  File? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FeedController.isLoading', context: context);

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

  late final _$getImageAsyncAction =
      AsyncAction('_FeedController.getImage', context: context);

  @override
  Future<void> getImage(String originImage) {
    return _$getImageAsyncAction.run(() => super.getImage(originImage));
  }

  late final _$uploadPostAsyncAction =
      AsyncAction('_FeedController.uploadPost', context: context);

  @override
  Future<void> uploadPost(String author, String text, SalaModel salaModel) {
    return _$uploadPostAsyncAction
        .run(() => super.uploadPost(author, text, salaModel));
  }

  @override
  String toString() {
    return '''
image: ${image},
isLoading: ${isLoading}
    ''';
  }
}
