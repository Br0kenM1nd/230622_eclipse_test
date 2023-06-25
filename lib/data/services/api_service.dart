import 'package:dio/dio.dart';
import 'package:eds_test/core/convert_to.dart';
import 'package:eds_test/data/models/album/album.dart';
import 'package:eds_test/data/models/comment/comment.dart';
import 'package:eds_test/data/models/photo/photo.dart';
import 'package:eds_test/data/models/post/post.dart';
import 'package:eds_test/data/models/user/user.dart';
import 'package:get_it/get_it.dart';

class ApiService {
  const ApiService();

  static final _http = GetIt.I.get<Dio>();

  Future<List<User>> getAllUsers() async {
    const url = '/users';
    final response = await _http.get(url);
    return const ConvertTo<User>().list(response.data, User.fromJson);
  }

  Future<List<Post>> getAllPosts() async {
    const url = '/posts';
    final response = await _http.get(url);
    return const ConvertTo<Post>().list(response.data, Post.fromJson);
  }

  Future<List<Album>> getAllAlbums() async {
    const url = '/albums';
    final response = await _http.get(url);
    return const ConvertTo<Album>().list(response.data, Album.fromJson);
  }

  Future<List<Photo>> getAllPhotos() async {
    const url = '/photos';
    final response = await _http.get(url);
    return const ConvertTo<Photo>().list(response.data, Photo.fromJson);
  }

  Future<List<Comment>> getAllComments() async {
    const url = '/comments/';
    final response = await _http.get(url);
    return const ConvertTo<Comment>().list(response.data, Comment.fromJson);
  }

  Future<List<Post>> getPostsByUserId(int userId) async {
    final url = '/user/$userId/posts';
    final response = await _http.get(url);
    return const ConvertTo<Post>().list(response.data, Post.fromJson);
  }

  Future<List<Album>> getAlbumsByUserId(int userId) async {
    final url = '/user/$userId/albums';
    final response = await _http.get(url);
    return const ConvertTo<Album>().list(response.data, Album.fromJson);
  }

  Future<List<AlbumWithPhotos>> getAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final url = '/user/$userId/albums?_embed=photos';
    final response = await _http.get(url);
    return const ConvertTo<AlbumWithPhotos>()
        .list(response.data, AlbumWithPhotos.fromJson);
  }

  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    final url = '/albums/$albumId/photos';
    final response = await _http.get(url);
    return const ConvertTo<Photo>().list(response.data, Photo.fromJson);
  }

  Future<List<Comment>> getCommentsByPostId(int postId) async {
    final url = '/posts/$postId/comments';
    final response = await _http.get(url);
    return const ConvertTo<Comment>().list(response.data, Comment.fromJson);
  }

  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    const url = '/comments';
    await _http.post(
      url,
      data: {
        'name': name,
        'email': email,
        'body': body,
      },
    );
  }
}
