import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wearher_app/models/weather_forecast_daily.dart';
import 'package:wearher_app/utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast>? snapshot;
  const DetailView({Key? key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<WeatherList>? forecastList = snapshot?.data?.list;
    double? pressure = forecastList![0].pressure! * 0.750062;
    int? humidity = forecastList[0].humidity;
    num? wind = forecastList[0].speed;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Util.getItem(FontAwesomeIcons.temperatureThreeQuarters,
            pressure.round(), 'mm Hg'),
        Util.getItem(FontAwesomeIcons.cloudRain, humidity!, '%'),
        Util.getItem(FontAwesomeIcons.wind, wind?.toInt(), 'm/s'),
      ],
    );
  }
}
