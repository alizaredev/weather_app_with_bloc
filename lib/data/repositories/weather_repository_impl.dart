import 'package:dartz/dartz.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_domain_repository.dart';
import '../datasourse/weather_datasourse.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherDatasourse weatherDataSourse;
  WeatherRepositoryImpl(this.weatherDataSourse);

  @override
  Future<Either<String, Weather>> getCurrentWeather(String cityName) {
    return weatherDataSourse.getWeather(cityName);
  }
}


