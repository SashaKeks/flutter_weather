import 'package:flutter/material.dart';
import 'package:wearher_app/models/weather_forecast_daily.dart';
import 'package:wearher_app/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecast>? snapshot, int index) {
  List<WeatherList>? forecastList = snapshot!.data!.list;
  String dayOfWeek = '';
  DateTime data = DateTime.fromMillisecondsSinceEpoch(
    forecastList![index].dt! * 1000,
  );
  String fullDate = Util.getFormattedDate(data);
  dayOfWeek = fullDate.split(',')[0];

  var tempMin = forecastList[index].temp!.min!.toStringAsFixed(0);

  String icon = forecastList[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$tempMin °C',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 1.2,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ],
  );
}
