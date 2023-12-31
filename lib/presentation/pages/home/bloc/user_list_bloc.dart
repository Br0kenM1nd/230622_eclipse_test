import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/user/user.dart';
import '../../../../data/services/api_service.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final ApiService api;

  UserListBloc([this.api = const ApiService()])
      : super(const UserListInitial()) {
    on<UserListGet>(_getUsers);
  }

  Future<void> _getUsers(UserListGet event, Emitter<UserListState> emit) async {
    try {
      emit(UserListLoaded(await api.getAllUsers()));
    } on DioException catch (e) {
      emit(UserListError(e.error.toString()));
    } on Exception catch (e) {
      emit(UserListError(e.toString()));
    }
  }
}
