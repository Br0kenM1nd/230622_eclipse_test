part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserGet extends UserEvent {
  final int userId;

  const UserGet(this.userId);

  @override
  List<Object> get props => [userId];
}
