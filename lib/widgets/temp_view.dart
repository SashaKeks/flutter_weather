import 'package:flutter/material.dart';
import 'package:wearher_app/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast>? snapshot;
  const TempView({Key? key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot?.data?.list;
    String? icon = forecastList?[0].getIconUrl();
    String? temp = forecastList?[0].temp?.day?.toStringAsFixed(0);
    String? description =
        forecastList?[0].weather?[0].description?.toUpperCase();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon!,
          scale: 0.7,
          color: Colors.black87,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          children: [
            Text(
              '$temp °C',
              style: const TextStyle(fontSize: 54.0, color: Colors.black87),
            ),
            Text(
              '$description',
              style: TextStyle(fontSize: 18.0, color: Colors.black87),
            ),
          ],
        )
      ],
    );
  }
}
