part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class SetThemeFromWeatherConditionEvent extends ThemeEvent {
  final WeatherCondition weatherCondition;
  SetThemeFromWeatherConditionEvent(this.weatherCondition);
}