import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'request_exception.dart';

typedef RequestFunction = Future<Response<dynamic>> Function();

final _logger = Logger();

Future<Response<dynamic>> handleRequest(RequestFunction requestFunction) async {
  try {
    final response = await requestFunction();

    if (_isInvalidCode(response)) {
      _logBadResponse(response);
      throw RequestException(
        response.statusMessage ?? 'Bad response',
        uri: response.requestOptions.uri,
      );
    }

    return response;
  } on DioException catch (exception) {
    _logError(exception);
    throw RequestException(
      exception.message ?? exception.error.toString(),
      uri: exception.requestOptions.uri,
    );
  } on Exception catch (exception) {
    throw RequestException(exception.toString());
  }
}

bool _isInvalidCode(Response<dynamic> response) =>
    response.statusCode == null ||
    response.statusCode! < 200 ||
    response.statusCode! >= 400;

void _logBadResponse(Response<dynamic> response) {
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

void _logError(DioException error) {
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
