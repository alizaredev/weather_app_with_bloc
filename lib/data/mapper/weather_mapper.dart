import '../../domain/entities/weather.dart';
import '../../domain/entities/weather_condition.dart';
import '../dto/weather_dto.dart';

class WeatherMapper {
  static Weather toDomain(WeatherDTO weatherDTO) {
    return Weather(
      cityName: weatherDTO.name,
      condition: _mapIcon(weatherDTO.icon, weatherDTO.speed),
      spped: weatherDTO.speed,
      temp: weatherDTO.tempe,
      main: weatherDTO.main,
      humidity: weatherDTO.humidity,
    );
  }

  static WeatherCondition _mapIcon(String icon, double speed) {
    if (speed >= 10) { 
      if (icon.endsWith('d')) {
        return WeatherCondition.sunWind;
      } else {
        return WeatherCondition.nightWind;
      }
    }

    switch (icon) {
      case '01d':
        return WeatherCondition.sunClear;
      case '01n':
        return WeatherCondition.nightClear;
      case '02d':
      case '03d':
      case '04d':
      case '50d':
        return WeatherCondition.sunClouds;
      case '02n':
      case '03n':
      case '04n':
      case '50n':
        return WeatherCondition.nightClouds;
      case '09d':
      case '10d':
        return WeatherCondition.sunRain;
      case '09n':
      case '10n':
        return WeatherCondition.nightRain;
      case '11d':
        return WeatherCondition.sunStorm;
      case '11n':
        return WeatherCondition.nightStorm;
      default:
        return WeatherCondition.sunClear; 
    }
  }
}