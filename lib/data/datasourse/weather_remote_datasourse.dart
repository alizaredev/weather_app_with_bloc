import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/entities/weather.dart';
import '../dto/weather_dto.dart';
import '../mapper/weather_mapper.dart';
import 'weather_datasourse.dart';

class WeatherRemoteDatasourse extends WeatherDatasourse {
  final Dio dioClient;
  WeatherRemoteDatasourse({required this.dioClient});

  @override
  Future<Either<String, Weather>> getWeather(String cityName) async {
    final apiKey = dotenv.env['API_KEY'];
    final String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';

    try {
      final response = await dioClient.get(url);

      if (response.data == null) {
        return left('پاسخ خالی از سرور دریافت شد.');
      }

      WeatherDTO weatherDTO = WeatherDTO.fromMapJson(response.data);
      return right(WeatherMapper.toDomain(weatherDTO));
    } on DioException catch (e) {
      String errorMessage;
      
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        errorMessage = 'The connection to the server timed out. Please try again.';
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'There is no internet connection. Please check your internet connection.';
      } else if (e.response != null) {
        // Server responded with error status
        final statusCode = e.response?.statusCode;
        if (statusCode == 404) {
          errorMessage = 'The requested city was not found. Please check the city name.';
        } else if (statusCode == 429) {
          errorMessage = 'The number of requests exceeds the limit. Please wait a moment.';
        } else if (statusCode != null && statusCode >= 500) {
          errorMessage = 'Server error. Please try again later.';
        } else {
          errorMessage = 'Error retrieving weather data. Error code: $statusCode';
        }
      } else {
        errorMessage = 'Error connecting to the server. Please try again.';
      }
      
      return left(errorMessage);
    } catch (e) {
      return left('An unexpected error occurred: ${e.toString()}');
    }
  }
}
