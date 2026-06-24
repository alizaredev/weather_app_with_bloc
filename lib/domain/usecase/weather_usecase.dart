import 'package:dartz/dartz.dart';

import '../entities/weather.dart';
import '../repositories/weather_domain_repository.dart';

class WeatherUsecase {
  WeatherRepository weatherDomainRepository;
  WeatherUsecase(this.weatherDomainRepository);

  Future<Either<String, Weather>> call(String cityName) {
    return weatherDomainRepository.getCurrentWeather(cityName);
  }
}
