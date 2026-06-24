import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/weather.dart';
import '../../domain/usecase/weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUsecase getWeatherUsecase;

  WeatherBloc(this.getWeatherUsecase) : super(LoadingDataState()) {
    on<LoadingDataEvent>(_loadWeather);
    on<RefreshDataEvent>(_loadWeather);
  }

  Future<void> _loadWeather(WeatherEvent event, Emitter<WeatherState> emit) async {
    emit(LoadingDataState());

    final result = await getWeatherUsecase.call("Tehran");

    result.fold(
      (error) => emit(FailedDataState(error)),
      (weather) => emit(LoadedDataState(weather)),
    );
  }
}
