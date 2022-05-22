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
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Colors.black87,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  icon: const Icon(
                    Icons.location_city,
                    color: Colors.black87,
                    size: 50,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => Navigator.pop(context, cityName),
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
