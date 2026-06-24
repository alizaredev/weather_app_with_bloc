import 'weather_condition.dart';

class Weather {
  final String cityName;
  final WeatherCondition condition;
  final double spped;
  final double temp;
  final String main;
  final int humidity;

  const Weather({
    required this.cityName,
    required this.condition,
    required this.spped,
    required this.temp,
    required this.main,
    required this.humidity,
  });
}
