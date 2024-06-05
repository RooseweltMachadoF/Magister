// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostController on _PostController, Store {
  late final _$postsAtom =
      Atom(name: '_PostController.posts', context: context);

  @override
  ObservableList<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PostController.isLoading', context: context);

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

  late final _$fetchPostsAsyncAction =
      AsyncAction('_PostController.fetchPosts', context: context);

  @override
  Future<void> fetchPosts() {
    return _$fetchPostsAsyncAction.run(() => super.fetchPosts());
  }

  late final _$addPostAsyncAction =
      AsyncAction('_PostController.addPost', context: context);

  @override
  Future<void> addPost(Post post) {
    return _$addPostAsyncAction.run(() => super.addPost(post));
  }

  @override
  String toString() {
    return '''
posts: ${posts},
isLoading: ${isLoading}
    ''';
  }
}
