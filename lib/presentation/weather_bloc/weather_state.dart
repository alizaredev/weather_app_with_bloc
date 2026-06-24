part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class LoadingDataState extends WeatherState {}

final class LoadedDataState extends WeatherState {
  final Weather weather;
  LoadedDataState(this.weather);
}

final class FailedDataState extends WeatherState {
  final String errorMessage;
  FailedDataState(this.errorMessage);
}
