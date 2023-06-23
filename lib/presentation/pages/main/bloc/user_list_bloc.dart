import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eds_test/data/services/api_service.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/user/user.dart';

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
    } on Exception catch (error) {
      emit(UserListError(error.toString()));
    }
  }
}
