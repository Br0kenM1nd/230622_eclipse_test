import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../photo/photo.dart';

part 'album.freezed.dart';

part 'album.g.dart';

@freezed
class Album extends HiveObject with _$Album {
  Album._();

  @HiveType(typeId: 0)
  factory Album({
    @HiveField(0) required int userId,
    @HiveField(1) required int id,
    @HiveField(2) required String title,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}

@freezed
class AlbumWithPhotos extends HiveObject with _$AlbumWithPhotos {
  AlbumWithPhotos._();

  @HiveType(typeId: 1)
  factory AlbumWithPhotos({
    @HiveField(0) required int userId,
    @HiveField(1) required int id,
    @HiveField(2) required String title,
    @HiveField(3) required List<Photo> photos,
  }) = _AlbumWithPhotos;

  factory AlbumWithPhotos.fromJson(Map<String, dynamic> json) =>
      _$AlbumWithPhotosFromJson(json);
}
