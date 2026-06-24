import 'package:flutter/material.dart';

import '../../domain/entities/weather_condition.dart';

extension WeatherConditionUI on WeatherCondition {
  bool get isNight => name.startsWith('night');

  String get image {
    switch (this) {
      case WeatherCondition.sunClear:
        return "sun";
      case WeatherCondition.sunClouds:
        return "day_cloudy";
      case WeatherCondition.sunRain:
        return "day_rain";
      case WeatherCondition.sunWind:
        return "day_wind";
      case WeatherCondition.sunSnow:
        return "day_snow";
      case WeatherCondition.sunStorm:
        return "day_thunderstorm";
      case WeatherCondition.nightClear:
        return "moon";
      case WeatherCondition.nightClouds:
        return "night_cloudy";
      case WeatherCondition.nightRain:
        return "night_rain";
      case WeatherCondition.nightSnow:
        return "night_snow";
      case WeatherCondition.nightWind:
        return "night_wind";
      case WeatherCondition.nightStorm:
        return "night_thunderstorm";
    }
  }

  Color get color {
    switch (this) {
      case WeatherCondition.sunClear:
      case WeatherCondition.nightClear:
        return const Color(0xffFF8E27);
      case WeatherCondition.sunClouds:
      case WeatherCondition.nightClouds:
        return const Color(0xff8EC1DD);
      case WeatherCondition.sunRain:
      case WeatherCondition.nightRain:
        return const Color(0xff4E8DB1);
      case WeatherCondition.sunSnow:
      case WeatherCondition.nightSnow:
        return const Color(0xff81CAF3);
      case WeatherCondition.sunStorm:
      case WeatherCondition.nightStorm:
        return const Color(0xffBF8EDD);
      case WeatherCondition.sunWind:
      case WeatherCondition.nightWind:
        return Color(0xff27B1FF);
    }
  }
}