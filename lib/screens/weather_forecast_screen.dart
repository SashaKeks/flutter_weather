import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wearher_app/api/weather_api.dart';
import 'package:wearher_app/models/weather_forecast_daily.dart';
import 'package:wearher_app/widgets/bottom_list_view.dart';
import 'package:wearher_app/widgets/city_view.dart';
import 'package:wearher_app/widgets/detail_view.dart';
import 'package:wearher_app/widgets/temp_view.dart';

class WearherForecastScreen extends StatefulWidget {
  const WearherForecastScreen({Key? key}) : super(key: key);

  @override
  State<WearherForecastScreen> createState() => _WearherForecastScreenState();
}

class _WearherForecastScreenState extends State<WearherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherAPI().fetchWeatherForecastWithCity(cityName: _cityName);
    // forecastObject?.then((weather) {
    //   // ignore: avoid_print
    //   print(weather.list?[0].weather?[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading:
            IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.location_city))
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherForecast>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    CityView(
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TempView(
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    DetailView(
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    BottomListView(
                      snapshot: snapshot,
                    ),
                  ],
                );
              } else {
                return const Center(
                    child: SpinKitSpinningLines(
                  color: Colors.black,
                  size: 100.0,
                ));
              }
            },
            future: forecastObject,
          )
        ],
      ),
    );
  }
}
