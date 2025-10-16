import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "075b7754347a40ccb5b120049251004";

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
      "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7",
    );

    http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to fetch weather");
    }

    Map<String, dynamic> data = jsonDecode(response.body);

    String apiCity = data['location']['name'].toString().toLowerCase().trim();
    String userCity = cityName.toLowerCase().trim();

    if (apiCity != userCity) {
      throw Exception("City name mismatch");
    }

    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
