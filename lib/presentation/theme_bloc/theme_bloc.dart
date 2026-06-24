import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/weather_condition.dart';
import '../extensions/weather_condition_ui.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(ThemeMode.light)) {
    on<SetThemeFromWeatherConditionEvent>(_onSetFromWeatherCondition);
  }

  void _onSetFromWeatherCondition(
    SetThemeFromWeatherConditionEvent event,
    Emitter<ThemeState> emit,
  ) {
    final isNight = event.weatherCondition.isNight;
    emit(ThemeState(isNight ? ThemeMode.dark : ThemeMode.light));
  }
}