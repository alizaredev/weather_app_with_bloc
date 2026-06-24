import 'package:dio/dio.dart';

class DioClient {
  static Dio? _instance;
  static Dio get instance {
    _instance ??= _createDio();
    return _instance!;
  }

  static Dio _createDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );
  }
}
