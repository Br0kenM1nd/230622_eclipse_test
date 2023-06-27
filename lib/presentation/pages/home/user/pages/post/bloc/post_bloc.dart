import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../data/models/comment/comment.dart';
import '../../../../../../../data/services/api_service.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService api;

  PostBloc([this.api = const ApiService()]) : super(const PostInitial()) {
    on<PostGetComments>(_getComments);
    on<PostReset>(_reset);
    on<PostAddComment>(_sendComment);
  }

  Future<void> _getComments(
    PostGetComments event,
    Emitter<PostState> emit,
  ) async {
    try {
      emit(PostCommentsLoaded(await api.getCommentsByPostId(event.postId)));
    } on DioException catch (e) {
      emit(PostError(e.error.toString()));
    } on Exception catch (e) {
      emit(PostError(e.toString()));
    }
  }

  Future<void> _sendComment(
    PostAddComment event,
    Emitter<PostState> emit,
  ) async {
    try {
      await api.sendComment(
        name: event.name,
        email: event.email,
        comment: event.comment,
      );
    } on DioException catch (e) {
      emit(PostError(e.error.toString()));
    } on Exception catch (e) {
      emit(PostError(e.toString()));
    }
  }

  void _reset(PostReset event, Emitter<PostState> emit) {
    emit(const PostInitial());
  }
}
