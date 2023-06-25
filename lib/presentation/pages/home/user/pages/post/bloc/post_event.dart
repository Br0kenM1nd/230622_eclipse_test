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
