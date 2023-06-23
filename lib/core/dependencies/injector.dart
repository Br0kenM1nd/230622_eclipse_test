import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../http/http.dart';
import 'observer.dart';

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  Bloc.observer = Observer();
  GetIt.I.registerSingleton<Dio>(const Http().createClient());
}
