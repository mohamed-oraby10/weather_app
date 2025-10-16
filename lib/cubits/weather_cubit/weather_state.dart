abstract class WeatherState {}

class WeatherInitial extends WeatherState {}


class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {}

class WeatherFailure extends WeatherState {
  final String errorMessage;

  WeatherFailure({required this.errorMessage});
}
