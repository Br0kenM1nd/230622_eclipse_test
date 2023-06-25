import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/utils/convert_to.dart';
import '../models/album/album.dart';
import '../models/comment/comment.dart';
import '../models/photo/photo.dart';
import '../models/post/post.dart';
import '../models/user/user.dart';

class ApiService {
  const ApiService();

  static final _http = GetIt.I.get<Dio>();

  Future<List<User>> getAllUsers() async {
    const url = '/users';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<User>().list(response.data!, User.fromJson);
  }

  Future<List<Post>> getAllPosts() async {
    const url = '/posts';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<Post>().list(response.data!, Post.fromJson);
  }

  Future<List<Album>> getAllAlbums() async {
    const url = '/albums';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<Album>().list(response.data!, Album.fromJson);
  }

  Future<List<Photo>> getAllPhotos() async {
    const url = '/photos';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<Photo>().list(response.data!, Photo.fromJson);
  }

  Future<List<Comment>> getAllComments() async {
    const url = '/comments/';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<Comment>().list(response.data!, Comment.fromJson);
  }

  Future<List<Post>> getPostsByUserId(int userId) async {
    final url = '/user/$userId/posts';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<Post>().list(response.data!, Post.fromJson);
  }

  Future<List<Album>> getAlbumsByUserId(int userId) async {
    final url = '/user/$userId/albums';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<Album>().list(response.data!, Album.fromJson);
  }

  Future<List<AlbumWithPhotos>> getAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final url = '/user/$userId/albums?_embed=photos';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<AlbumWithPhotos>()
        .list(response.data!, AlbumWithPhotos.fromJson);
  }

  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    final url = '/albums/$albumId/photos';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<Photo>().list(response.data!, Photo.fromJson);
  }

  Future<List<Comment>> getCommentsByPostId(int postId) async {
    final url = '/posts/$postId/comments';
    final response = await _http.get<List<dynamic>>(url);
    return const ConvertTo<Comment>().list(response.data!, Comment.fromJson);
  }

  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    const url = '/comments';
    await _http.post<Response<dynamic>>(
      url,
      data: {
        'name': name,
        'email': email,
        'body': body,
      },
    );
  }
}
