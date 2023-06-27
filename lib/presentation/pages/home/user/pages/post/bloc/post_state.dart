part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  const PostInitial();

  @override
  List<Object> get props => [];
}

class PostCommentsLoaded extends PostState {
  final List<Comment> comments;

  const PostCommentsLoaded(this.comments);

  @override
  List<Object> get props => [comments];
}

class PostError extends PostState {
  final String error;

  const PostError(this.error);

  @override
  List<Object> get props => [error];
}
