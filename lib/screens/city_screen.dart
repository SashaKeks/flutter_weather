import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Choose your city'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                cursorColor: Colors.blueGrey[800],
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter city name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Colors.black87,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.black87,
                    size: 50,
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              child: const Text(
                'Get weather',
                style: TextStyle(fontSize: 30.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
