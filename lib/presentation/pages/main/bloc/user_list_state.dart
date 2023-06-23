part of 'user_list_bloc.dart';

abstract class UserListState extends Equatable {
  const UserListState();
}

class UserListInitial extends UserListState {
  const UserListInitial();

  @override
  List<Object> get props => [];
}

class UserListLoaded extends UserListState {
  final List<User> users;

  const UserListLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UserListError extends UserListState {
  final String error;

  const UserListError(this.error);

  @override
  List<Object> get props => [error];
}
