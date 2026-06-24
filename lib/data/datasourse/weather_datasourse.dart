import 'package:dartz/dartz.dart';

import '../../domain/entities/weather.dart';

abstract class WeatherDatasourse {
  Future<Either<String, Weather>> getWeather(String cityName);
}
