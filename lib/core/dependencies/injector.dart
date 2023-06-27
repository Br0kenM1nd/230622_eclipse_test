import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/album/album.dart';
import '../../data/models/comment/comment.dart';
import '../../data/models/photo/photo.dart';
import '../../data/models/post/post.dart';
import '../../data/models/user/user.dart';
import '../http/http.dart';
import 'observer.dart';

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  Bloc.observer = Observer();
  GetIt.I.registerSingleton<Dio>(const Http().createClient());
  await _initializeLocalStorage();
}

Future<void> _initializeLocalStorage() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(AlbumAdapter())
    ..registerAdapter(CommentAdapter())
    ..registerAdapter(PhotoAdapter())
    ..registerAdapter(PostAdapter())
    ..registerAdapter(UserAdapter())
    ..registerAdapter(AddressAdapter())
    ..registerAdapter(GeoAdapter())
    ..registerAdapter(AlbumWithPhotosAdapter())
    ..registerAdapter(CompanyAdapter());
}
