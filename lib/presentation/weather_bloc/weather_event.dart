part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class LoadingDataEvent extends WeatherEvent {}

final class RefreshDataEvent extends WeatherEvent {}
