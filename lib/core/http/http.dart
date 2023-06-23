import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Http {
  const Http();

  Dio createClient() => Dio()
    ..options.baseUrl = baseUrl ?? 'Unable access .env base url!'
    ..options.connectTimeout = const Duration(seconds: 15)
    ..options.receiveTimeout = const Duration(seconds: 15)
    ..options.validateStatus = _noValidation
    ..interceptors.add(InterceptorsWrapper(onError: _throwError));

  static String? get baseUrl => dotenv.env['PROD'];

  static bool _noValidation(int? _) => true;

  static void _throwError(DioException exception, ErrorInterceptorHandler _) {
    String? exceptionText;
    if (exception.response != null) {
      exceptionText = exception.response?.data.toString();
    } else {
      switch (exception.error.runtimeType) {
        case SocketException:
          exception.error.toString().contains('Failed host lookup')
              ? exceptionText = 'Ошибка подключения к серверу'
              : exceptionText = 'Отсутствует подключение к интернету';
          break;
        default:
          exceptionText = 'Возникло исключение:\n${exception.error}';
      }
    }
    if (exceptionText != null) throw exceptionText;
  }
}
