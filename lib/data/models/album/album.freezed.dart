// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return _Album.fromJson(json);
}

/// @nodoc
mixin _$Album {
  @HiveField(0)
  int get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  int get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res, Album>;
  @useResult
  $Res call(
      {@HiveField(0) int userId,
      @HiveField(1) int id,
      @HiveField(2) String title});
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res, $Val extends Album>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$$_AlbumCopyWith(_$_Album value, $Res Function(_$_Album) then) =
      __$$_AlbumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int userId,
      @HiveField(1) int id,
      @HiveField(2) String title});
}

/// @nodoc
class __$$_AlbumCopyWithImpl<$Res> extends _$AlbumCopyWithImpl<$Res, _$_Album>
    implements _$$_AlbumCopyWith<$Res> {
  __$$_AlbumCopyWithImpl(_$_Album _value, $Res Function(_$_Album) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_Album(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0)
class _$_Album extends _Album {
  _$_Album(
      {@HiveField(0) required this.userId,
      @HiveField(1) required this.id,
      @HiveField(2) required this.title})
      : super._();

  factory _$_Album.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumFromJson(json);

  @override
  @HiveField(0)
  final int userId;
  @override
  @HiveField(1)
  final int id;
  @override
  @HiveField(2)
  final String title;

  @override
  String toString() {
    return 'Album(userId: $userId, id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Album &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumCopyWith<_$_Album> get copyWith =>
      __$$_AlbumCopyWithImpl<_$_Album>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumToJson(
      this,
    );
  }
}

abstract class _Album extends Album {
  factory _Album(
      {@HiveField(0) required final int userId,
      @HiveField(1) required final int id,
      @HiveField(2) required final String title}) = _$_Album;
  _Album._() : super._();

  factory _Album.fromJson(Map<String, dynamic> json) = _$_Album.fromJson;

  @override
  @HiveField(0)
  int get userId;
  @override
  @HiveField(1)
  int get id;
  @override
  @HiveField(2)
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumCopyWith<_$_Album> get copyWith =>
      throw _privateConstructorUsedError;
}

AlbumWithPhotos _$AlbumWithPhotosFromJson(Map<String, dynamic> json) {
  return _AlbumWithPhotos.fromJson(json);
}

/// @nodoc
mixin _$AlbumWithPhotos {
  @HiveField(0)
  int get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  int get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  List<Photo> get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumWithPhotosCopyWith<AlbumWithPhotos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumWithPhotosCopyWith<$Res> {
  factory $AlbumWithPhotosCopyWith(
          AlbumWithPhotos value, $Res Function(AlbumWithPhotos) then) =
      _$AlbumWithPhotosCopyWithImpl<$Res, AlbumWithPhotos>;
  @useResult
  $Res call(
      {@HiveField(0) int userId,
      @HiveField(1) int id,
      @HiveField(2) String title,
      @HiveField(3) List<Photo> photos});
}

/// @nodoc
class _$AlbumWithPhotosCopyWithImpl<$Res, $Val extends AlbumWithPhotos>
    implements $AlbumWithPhotosCopyWith<$Res> {
  _$AlbumWithPhotosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumWithPhotosCopyWith<$Res>
    implements $AlbumWithPhotosCopyWith<$Res> {
  factory _$$_AlbumWithPhotosCopyWith(
          _$_AlbumWithPhotos value, $Res Function(_$_AlbumWithPhotos) then) =
      __$$_AlbumWithPhotosCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int userId,
      @HiveField(1) int id,
      @HiveField(2) String title,
      @HiveField(3) List<Photo> photos});
}

/// @nodoc
class __$$_AlbumWithPhotosCopyWithImpl<$Res>
    extends _$AlbumWithPhotosCopyWithImpl<$Res, _$_AlbumWithPhotos>
    implements _$$_AlbumWithPhotosCopyWith<$Res> {
  __$$_AlbumWithPhotosCopyWithImpl(
      _$_AlbumWithPhotos _value, $Res Function(_$_AlbumWithPhotos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? photos = null,
  }) {
    return _then(_$_AlbumWithPhotos(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$_AlbumWithPhotos extends _AlbumWithPhotos {
  _$_AlbumWithPhotos(
      {@HiveField(0) required this.userId,
      @HiveField(1) required this.id,
      @HiveField(2) required this.title,
      @HiveField(3) required final List<Photo> photos})
      : _photos = photos,
        super._();

  factory _$_AlbumWithPhotos.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumWithPhotosFromJson(json);

  @override
  @HiveField(0)
  final int userId;
  @override
  @HiveField(1)
  final int id;
  @override
  @HiveField(2)
  final String title;
  final List<Photo> _photos;
  @override
  @HiveField(3)
  List<Photo> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'AlbumWithPhotos(userId: $userId, id: $id, title: $title, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumWithPhotos &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title,
      const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumWithPhotosCopyWith<_$_AlbumWithPhotos> get copyWith =>
      __$$_AlbumWithPhotosCopyWithImpl<_$_AlbumWithPhotos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumWithPhotosToJson(
      this,
    );
  }
}

abstract class _AlbumWithPhotos extends AlbumWithPhotos {
  factory _AlbumWithPhotos(
      {@HiveField(0) required final int userId,
      @HiveField(1) required final int id,
      @HiveField(2) required final String title,
      @HiveField(3) required final List<Photo> photos}) = _$_AlbumWithPhotos;
  _AlbumWithPhotos._() : super._();

  factory _AlbumWithPhotos.fromJson(Map<String, dynamic> json) =
      _$_AlbumWithPhotos.fromJson;

  @override
  @HiveField(0)
  int get userId;
  @override
  @HiveField(1)
  int get id;
  @override
  @HiveField(2)
  String get title;
  @override
  @HiveField(3)
  List<Photo> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumWithPhotosCopyWith<_$_AlbumWithPhotos> get copyWith =>
      throw _privateConstructorUsedError;
}
