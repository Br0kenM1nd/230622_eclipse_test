import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class Http {
  const Http();

  static final _logger = Logger();

  Dio createClient() => Dio()
    ..options.baseUrl = baseUrl ?? 'Unable access .env base url!'
    ..options.connectTimeout = const Duration(seconds: 15)
    ..options.receiveTimeout = const Duration(seconds: 15)
    ..interceptors.add(InterceptorsWrapper(onError: _throwError));

  static String? get baseUrl => dotenv.env['PROD'];

  static void _throwError(DioException exception, ErrorInterceptorHandler _) {
    String? exceptionText;
    if (exception.response != null) {
      _logBadResponse(exception.response!);
      exceptionText = _getErrorInfo(exception.response!);
      throw HttpException(exceptionText, uri: exception.requestOptions.uri);
    } else {
      _logError(exception);
    }

    if (exception.error is SocketException) {
      exceptionText =
          _getSocketExceptionInfo(exception.error as SocketException);
    } else if (exception.error is HandshakeException) {
      exceptionText = 'Ошибка сертификата SSL.\n'
          'Пожалуйста, свяжитесь с техподдержкой.';
    } else if (exception.error is FormatException) {
      exceptionText = 'Неверный формат данных получен от сервера.\n'
          'Пожалуйста, свяжитесь с техподдержкой.';
    } else {
      exceptionText = 'Возникло исключение:\n${exception.error}';
    }
    throw HttpException(exceptionText, uri: exception.requestOptions.uri);
  }

  static String _getSocketExceptionInfo(SocketException exception) {
    if (exception.message.contains('Failed host lookup')) {
      return 'Ошибка подключения к серверу.\n'
          'Пожалуйста, проверьте своё интернет-соединение и попробуйте снова.';
    } else if (exception.message.contains('Connection timed out')) {
      return 'Сервер не отвечает.\nПожалуйста, попробуйте позже.';
    } else if (exception.message.contains('Connection refused')) {
      return 'Соединение отклонено сервером.\n'
          'Пожалуйста, свяжитесь с техподдержкой.';
    } else {
      return 'Проблема с сетью.\n'
          'Пожалуйста, проверьте своё интернет-соединение и попробуйте снова.';
    }
  }

  static String _getErrorInfo(Response<dynamic> response) {
    switch (response.statusCode) {
      case 404:
        return 'Страница не найдена';
      case 500:
        return 'Произошла внутренняя ошибка сервера.\n'
            'Пожалуйста, свяжитесь с техподдержкой.';
      default:
        return 'Произошла нестандартная ошибка.\n'
            'Пожалуйста, свяжитесь с техподдержкой.\n'
            'Код ошибки: ${response.statusCode}\n'
            'Текст ошибки: ${response.statusMessage}';
    }
  }

  static void _logBadResponse(Response<dynamic> response) {
    _logger.e(
      'Error occur while HTTP CRUD!\n'
      'Path: ${response.requestOptions.path}\n'
      'Full uri: ${response.realUri}\n'
      'Status code: ${response.statusCode}\n'
      'Query parameters: ${response.requestOptions.queryParameters}\n'
      'Request data: ${response.requestOptions.data}\n'
      'Response data: ${response.data}',
    );
  }

  static void _logError(DioException error) {
    _logger.e(
      'Error occur while HTTP CRUD!\n'
      'Path: ${error.requestOptions.path}\n'
      'Full uri: ${error.requestOptions.uri}\n'
      'Query parameters: ${error.requestOptions.queryParameters}\n'
      'Headers: ${error.requestOptions.headers}\n'
      'Status code: ${error.response?.statusCode}\n'
      'Request data: ${error.requestOptions.data}\n'
      'Error: ${error.error}\n'
      'Response: ${error.response}\n'
      'Response data: ${error.response?.data}',
    );
  }
}
