import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../data/models/comment/comment.dart';
import '../../../../../../../data/services/api_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService api;

  PostBloc([this.api = const ApiService()]) : super(PostInitial()) {
    on<PostGetComments>(_getPost);
  }

  Future<void> _getPost(PostGetComments event, Emitter<PostState> emit) async {
    emit(PostCommentsLoaded(await api.getCommentsByPostId(event.postId)));
  }
}
