import 'dart:io';

class RequestException extends HttpException {
  final Uri? uri;

  RequestException(String message, {this.uri}) : super(message, uri: uri);
}
