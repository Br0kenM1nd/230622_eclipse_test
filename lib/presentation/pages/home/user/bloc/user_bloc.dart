import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/models/album/album.dart';
import '../../../../../data/models/post/post.dart';
import '../../../../../data/services/api_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiService api;

  UserBloc([this.api = const ApiService()]) : super(UserInitial()) {
    on<UserGet>(_getUser);
  }

  Future<void> _getUser(UserGet event, Emitter<UserState> emit) async {
    emit(UserLoaded(
      posts: await api.getPostsByUserId(event.userId),
      albums: await api.getAlbumsByUserIdWithPhotos(event.userId),
    ));
  }
}
