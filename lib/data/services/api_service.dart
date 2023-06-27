import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/utils/convert_to.dart';
import '../models/album/album.dart';
import '../models/comment/comment.dart';
import '../models/photo/photo.dart';
import '../models/post/post.dart';
import '../models/user/user.dart';
import 'local_storage.dart';

class ApiService {
  const ApiService();

  static final _http = GetIt.I.get<Dio>();

  Future<List<User>> getAllUsers() async {
    const path = '/users';
    final data = await LocalStorage.getData<User>(path);
    if (data != null && data.isNotEmpty) return List<User>.from(data);

    final response = await _http.get(path);
    final users = await ConvertTo.list<User>(response.data, User.fromJson);
    LocalStorage.saveData(path, users);
    return users;
  }

  Future<List<Post>> getAllPosts() async {
    const path = '/posts';
    final data = await LocalStorage.getData<Post>(path);
    if (data != null && data.isNotEmpty) return List<Post>.from(data);

    final response = await _http.get(path);
    final posts = await ConvertTo.list<Post>(response.data, Post.fromJson);
    LocalStorage.saveData(path, posts);
    return posts;
  }

  Future<List<Album>> getAllAlbums() async {
    const path = '/albums';
    final data = await LocalStorage.getData<Album>(path);
    if (data != null && data.isNotEmpty) return List<Album>.from(data);

    final response = await _http.get(path);
    final albums = await ConvertTo.list<Album>(response.data, Album.fromJson);
    LocalStorage.saveData(path, albums);
    return albums;
  }

  Future<List<Photo>> getAllPhotos() async {
    const path = '/photos';
    final data = await LocalStorage.getData<Photo>(path);
    if (data != null && data.isNotEmpty) return List<Photo>.from(data);

    final response = await _http.get(path);
    final photos = await ConvertTo.list<Photo>(response.data, Photo.fromJson);
    LocalStorage.saveData(path, photos);
    return photos;
  }

  Future<List<Comment>> getAllComments() async {
    const path = '/comments';
    final data = await LocalStorage.getData<Comment>(path);
    if (data != null && data.isNotEmpty) return List<Comment>.from(data);

    final response = await _http.get(path);
    final comments =
        await ConvertTo.list<Comment>(response.data, Comment.fromJson);
    LocalStorage.saveData(path, comments);
    return comments;
  }

  Future<List<Post>> getPostsByUserId(int userId) async {
    final path = '/user/$userId/posts';
    final data = await LocalStorage.getData<Post>(path);
    if (data != null && data.isNotEmpty) return List<Post>.from(data);

    final response = await _http.get(path);
    final posts = await ConvertTo.list<Post>(response.data, Post.fromJson);
    LocalStorage.saveData(path, posts);
    return posts;
  }

  Future<List<Album>> getAlbumsByUserId(int userId) async {
    final path = '/user/$userId/albums';
    final data = await LocalStorage.getData<Album>(path);
    if (data != null && data.isNotEmpty) return List<Album>.from(data);

    final response = await _http.get(path);
    final albums = await ConvertTo.list<Album>(response.data, Album.fromJson);
    LocalStorage.saveData(path, albums);
    return albums;
  }

  Future<List<AlbumWithPhotos>> getAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final path = '/user/$userId/albums?_embed=photos';
    final data = await LocalStorage.getData<AlbumWithPhotos>(path);
    if (data != null && data.isNotEmpty) {
      return List<AlbumWithPhotos>.from(data);
    }

    final response = await _http.get(path);
    final albumsWithPhotos = await ConvertTo.list<AlbumWithPhotos>(
      response.data,
      AlbumWithPhotos.fromJson,
    );
    LocalStorage.saveData(path, albumsWithPhotos);
    return albumsWithPhotos;
  }

  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    final path = '/albums/$albumId/photos';
    final data = await LocalStorage.getData<Photo>(path);
    if (data != null && data.isNotEmpty) return List<Photo>.from(data);

    final response = await _http.get(path);
    final photos = await ConvertTo.list<Photo>(response.data, Photo.fromJson);
    LocalStorage.saveData(path, photos);
    return photos;
  }

  Future<List<Comment>> getCommentsByPostId(int postId) async {
    final path = '/posts/$postId/comments';
    final data = await LocalStorage.getData<Comment>(path);
    if (data != null && data.isNotEmpty) return List<Comment>.from(data);

    final response = await _http.get(path);
    final comments =
        await ConvertTo.list<Comment>(response.data, Comment.fromJson);
    LocalStorage.saveData(path, comments);
    return comments;
  }

  Future<void> sendComment({
    required String name,
    required String email,
    required String comment,
  }) async {
    const path = '/comments';
    await _http.post<Map<String, dynamic>>(
      path,
      data: {
        'name': name,
        'email': email,
        'body': comment,
      },
    );
  }
}
