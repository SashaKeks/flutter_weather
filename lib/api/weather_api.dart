import 'dart:developer';
import 'dart:convert';
import 'package:wearher_app/models/weather_forecast_daily.dart';
import 'package:wearher_app/utilities/constants.dart';
import 'package:http/http.dart' as http;

class WeatherAPI {
  Future<WeatherForecast> fetchWeatherForecastWithCity({required String cityName}) async {
    '''Request to the API with weather''';
    var queryParameters = {
      'APPID': Constants.weatherAppId,
      'units': 'metric',
      'q': cityName,
    };
    var uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath, queryParameters);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    // ignore: avoid_print
    print('responce: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
