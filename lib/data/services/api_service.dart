import 'dart:convert';

import 'package:eds_test/data/models/album/album.dart';
import 'package:eds_test/data/models/comment/comment.dart';
import 'package:eds_test/data/models/photo/photo.dart';
import 'package:eds_test/data/models/post/post.dart';
import 'package:eds_test/data/models/user/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<User>> getAllUsers() async {
    const url = '$baseUrl/users/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(User.fromJson).toList();
  }

  static Future<List<Post>> getAllPosts() async {
    const url = '$baseUrl/posts/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(Post.fromJson).toList();
  }

  static Future<List<Album>> getAllAlbums() async {
    const url = '$baseUrl/albums';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(Album.fromJson).toList();
  }

  static Future<List<Photo>> getAllPhotos() async {
    const url = '$baseUrl/photos/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(Photo.fromJson).toList();
  }

  static Future<List<Comment>> getAllComments() async {
    const url = '$baseUrl/comments/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(Comment.fromJson).toList();
  }

  static Future<List<Post>> getPostsByUserId(int userId) async {
    final url = '$baseUrl/user/$userId/posts';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(Post.fromJson).toList();
  }

  static Future<List<Album>> getAlbumsByUserId(int userId) async {
    final url = '$baseUrl/user/$userId/albums';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(Album.fromJson).toList();
  }

  static Future<List<AlbumWithPhotos>> getAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final url = '$baseUrl/user/$userId/albums?_embed=photos';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(AlbumWithPhotos.fromJson).toList();
  }

  static Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    final url = '$baseUrl/albums/$albumId/photos/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(Photo.fromJson).toList();
  }

  static Future<List<Comment>> getCommentsByPostId(int postId) async {
    final url = '$baseUrl/posts/$postId/comments/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(Comment.fromJson).toList();
  }

  static Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    const url = '$baseUrl/comments/';
    await http.post(
      Uri.parse(url),
      body: {
        'name': name,
        'email': email,
        'body': body,
      },
    );
  }
}
