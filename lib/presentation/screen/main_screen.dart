import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/locator.dart';
import '../theme_bloc/theme_bloc.dart';
import '../weather_bloc/weather_bloc.dart';
import 'weather_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = WeatherBloc(locator.get());
        bloc.add(LoadingDataEvent());
        return bloc;
      },
      child: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          // Update theme based on weather condition when weather is loaded
          if (state is LoadedDataState) {
            context.read<ThemeBloc>().add(
                  SetThemeFromWeatherConditionEvent(state.weather.condition),
                );
          }
        },
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return Scaffold(body: _buildByState(context, state));
          },
        ),
      ),
    );
  }

  Widget _buildByState(BuildContext context, WeatherState state) {
    switch (state) {
      case LoadingDataState():
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LoadedDataState():
        return WeatherScreen(weather: state.weather);
      case FailedDataState():
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red.shade300,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error catch data',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  state.errorMessage,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<WeatherBloc>().add(RefreshDataEvent());
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try again'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
