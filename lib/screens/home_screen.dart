import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/weather_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app", style: TextStyle(color: Colors.white)),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return WeatherBody(weatherData: weatherData);
          } else if (state is WeatherFailure) {
            return Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            return Center(
              child: Text(
                "there is no weather \nstart searching now ",
                style: TextStyle(fontSize: 26),
              ),
            );
          }
        },
      ),
    );
  }
}
