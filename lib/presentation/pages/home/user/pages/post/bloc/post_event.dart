part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostGetComments extends PostEvent {
  final int postId;

  const PostGetComments(this.postId);

  @override
  List<Object> get props => [postId];
}

class PostReset extends PostEvent {
  const PostReset();

  @override
  List<Object> get props => [];
}

class PostAddComment extends PostEvent {
  final String name;
  final String email;
  final String comment;

  const PostAddComment({
    required this.name,
    required this.email,
    required this.comment,
  });

  @override
  List<Object> get props => [name, email, comment];
}
