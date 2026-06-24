import 'package:dartz/dartz.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<String, Weather>> getCurrentWeather(String name);
}