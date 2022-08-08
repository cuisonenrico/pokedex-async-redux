import 'dart:io';
import 'package:async_redux/async_redux.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  late Dio dio;
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  ApiClient() {
    dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(QueuedInterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onError: (error, handler) {
          if (error.error is SocketException) {
            throw const UserException('Cant connect to the internet');
          } else if (error.response!.statusCode! >= 500) {
            throw const UserException('Server Error!');
          }
        },
      ));
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
    ));
  }
}
