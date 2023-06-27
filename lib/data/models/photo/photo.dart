import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'photo.freezed.dart';

part 'photo.g.dart';

@freezed
class Photo extends HiveObject with _$Photo {
  Photo._();

  @HiveType(typeId: 3)
  factory Photo({
    @HiveField(0) required int albumId,
    @HiveField(1) required int id,
    @HiveField(2) required String title,
    @HiveField(3) required String url,
    @HiveField(4) required String thumbnailUrl,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
