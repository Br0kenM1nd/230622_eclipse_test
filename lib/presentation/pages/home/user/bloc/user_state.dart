part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final List<Post> posts;
  final List<AlbumWithPhotos> albums;

  const UserLoaded({required this.posts, required this.albums});

  @override
  List<Object> get props => [posts, albums];
}

class UserError extends UserState {
  final String error;

  const UserError(this.error);

  @override
  List<Object> get props => [error];
}
