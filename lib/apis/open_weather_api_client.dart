import 'dart:convert';

import 'package:teleport_weather_forecast/models/models.dart';
import 'package:teleport_weather_forecast/utils/weather_util.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class OpenWeatherApiClient {
  static const baseUrl = 'http://api.openweathermap.org';
  final apiKey = WeatherUtil.apiKey;
  final http.Client httpClient;

  OpenWeatherApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Weather> getCurrentWeatherByLocId(int locationId) async {
    final weatherUrl =
        '$baseUrl/data/2.5/weather?id=$locationId&units=metric&appid=$apiKey';
    final weatherResponse = await this.httpClient.get(Uri.parse(weatherUrl));

    if (weatherResponse.statusCode != 200) {
      throw Exception('Error getting weather for location!');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }

  Future<Weather> getCurrentWeatherByLatLong(double lat, double long) async {
    final weatherUrl =
        '$baseUrl/data/2.5/weather?lat=$lat&lon=$long&units=metric&appid=$apiKey';
    final weatherResponse = await this.httpClient.get(Uri.parse(weatherUrl));

    if (weatherResponse.statusCode != 200) {
      throw Exception('Error getting weather for location!');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }

  // TODO: Create 5-day weather forecast method.
}
