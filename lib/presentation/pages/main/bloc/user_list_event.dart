part of 'user_list_bloc.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();
}

class UserListGet extends UserListEvent {
  const UserListGet();

  @override
  List<Object> get props => [];
}
