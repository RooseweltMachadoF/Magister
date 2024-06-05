// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommentsController on _CommentsController, Store {
  late final _$commentsAtom =
      Atom(name: '_CommentsController.comments', context: context);

  @override
  ObservableList<CommentsModel> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(ObservableList<CommentsModel> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$likesAtom =
      Atom(name: '_CommentsController.likes', context: context);

  @override
  ObservableList<String> get likes {
    _$likesAtom.reportRead();
    return super.likes;
  }

  @override
  set likes(ObservableList<String> value) {
    _$likesAtom.reportWrite(value, super.likes, () {
      super.likes = value;
    });
  }

  late final _$fetchCommentsAsyncAction =
      AsyncAction('_CommentsController.fetchComments', context: context);

  @override
  Future<void> fetchComments() {
    return _$fetchCommentsAsyncAction.run(() => super.fetchComments());
  }

  late final _$fetchLikesAsyncAction =
      AsyncAction('_CommentsController.fetchLikes', context: context);

  @override
  Future<void> fetchLikes() {
    return _$fetchLikesAsyncAction.run(() => super.fetchLikes());
  }

  late final _$addCommentAsyncAction =
      AsyncAction('_CommentsController.addComment', context: context);

  @override
  Future<void> addComment(CommentsModel comment) {
    return _$addCommentAsyncAction.run(() => super.addComment(comment));
  }

  late final _$toggleLikeAsyncAction =
      AsyncAction('_CommentsController.toggleLike', context: context);

  @override
  Future<void> toggleLike(String userId) {
    return _$toggleLikeAsyncAction.run(() => super.toggleLike(userId));
  }

  @override
  String toString() {
    return '''
comments: ${comments},
likes: ${likes}
    ''';
  }
}
