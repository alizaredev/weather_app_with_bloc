import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../extensions/weather_condition_ui.dart';
import '../../domain/entities/weather.dart';

class WeatherScreen extends StatelessWidget {
  final Weather weather;

  const WeatherScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final today = DateFormat('MMMM d, yyyy', 'en_US').format(DateTime.now());
    final isNight = weather.condition.isNight;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 37),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                today,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                weather.cityName,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 49),
              SizedBox(
                width: 366,
                height: 366,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                      child: Opacity(
                        opacity: 0.35,
                        child: Image.asset(
                          'assets/images/${weather.condition.image}.png',
                          width: 350,
                          height: 350,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/${weather.condition.image}.png',
                      width: 350,
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  if (isNight) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffF9FAFB),
                        Color.fromARGB(0, 249, 250, 251),
                      ],
                    ).createShader(bounds);
                  } else {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF111827),
                        Color(0xFF6B7280),
                      ],
                    ).createShader(bounds);
                  }
                },
                child: Text(
                  "${weather.temp.toStringAsFixed(0)}°",
                  style: const TextStyle(
                    fontSize: 144,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                weather.main,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: weather.condition.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
