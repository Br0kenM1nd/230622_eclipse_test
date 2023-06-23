import 'package:dio/dio.dart';
import 'package:eds_test/core/convert_to.dart';
import 'package:eds_test/core/http/request_handler.dart';
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
    final res = await handleRequest(() => _http.get(url));
    return const ConvertTo<User>().list(res.data, User.fromJson);
  }

  Future<List<Post>> getAllPosts() async {
    const url = '/posts';
    final res = await handleRequest(() => _http.get(url));
    return const ConvertTo<Post>().list(res.data, Post.fromJson);
  }

  Future<List<Album>> getAllAlbums() async {
    const url = '/albums';
    final res = await handleRequest(() => _http.get(url));
    return const ConvertTo<Album>().list(res.data, Album.fromJson);
  }

  Future<List<Photo>> getAllPhotos() async {
    const url = '/photos';
    final res = await handleRequest(() => _http.get(url));
    return const ConvertTo<Photo>().list(res.data, Photo.fromJson);
  }

  Future<List<Comment>> getAllComments() async {
    const url = '/comments/';
    final res = await handleRequest(() => _http.get(url));
    return const ConvertTo<Comment>().list(res.data, Comment.fromJson);
  }

  Future<List<Post>> getPostsByUserId(int userId) async {
    final url = '/user/$userId/posts';
    final res = await handleRequest(() => _http.get(url));
    return const ConvertTo<Post>().list(res.data, Post.fromJson);
  }

  Future<List<Album>> getAlbumsByUserId(int userId) async {
    final url = '/user/$userId/albums';
    final res = await handleRequest(() => _http.get(url));

    return const ConvertTo<Album>().list(res.data, Album.fromJson);
  }

  Future<List<AlbumWithPhotos>> getAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final url = '/user/$userId/albums?_embed=photos';
    final res = await handleRequest(() => _http.get(url));
    return const ConvertTo<AlbumWithPhotos>()
        .list(res.data, AlbumWithPhotos.fromJson);
  }

  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    final url = '/albums/$albumId/photos';
    final res = await handleRequest(() => _http.get(url));
    return const ConvertTo<Photo>().list(res.data, Photo.fromJson);
  }

  Future<List<Comment>> getCommentsByPostId(int postId) async {
    final url = '/posts/$postId/comments';
    final res = await handleRequest(() => _http.get(url));
    return const ConvertTo<Comment>().list(res.data, Comment.fromJson);
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
