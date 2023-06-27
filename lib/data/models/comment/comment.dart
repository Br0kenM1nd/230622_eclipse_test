import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'comment.freezed.dart';

part 'comment.g.dart';

@freezed
class Comment extends HiveObject with _$Comment {
  Comment._();

  @HiveType(typeId: 2)
  factory Comment({
    @HiveField(0) required int postId,
    @HiveField(1) required int id,
    @HiveField(2) required String name,
    @HiveField(3) required String email,
    @HiveField(4) required String body,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
