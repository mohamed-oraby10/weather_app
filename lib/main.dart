import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.orange
                : BlocProvider.of<WeatherCubit>(
                  context,
                ).weatherModel!.getThemeColor(),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
