import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/di/locator.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screen/main_screen.dart';
import 'presentation/theme_bloc/theme_bloc.dart';

void main(List<String> args) async {
  await dotenv.load();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
