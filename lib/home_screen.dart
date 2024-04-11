import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_item.dart';
import 'package:weather_app/api.dart';
import 'package:weather_app/forecast_item.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = "";
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String city = "indore";
      cityName = city;
      final result = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$owAPIKEY",
      ));

      final apiData = jsonDecode(result.body);
      if (apiData['cod'] != '200') {
        throw apiData["message"];
      }
      return apiData;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  HapticFeedback.heavyImpact();
                  weather = getCurrentWeather();
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          // print(snapshot);
          // print(snapshot.runtimeType);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator(
              color: Colors.white,
              minHeight: 1,
            );
          }

          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline_sharp,
                    color: Colors.redAccent, size: 40),
                const SizedBox(height: 15),
                Center(
                    child: Text(snapshot.error.toString(),
                        style: const TextStyle(fontSize: 20))),
              ],
            );
          }

          final data = snapshot.data!;

          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];
          final ctCel = (currentTemp - 273.15).round();
          final currentSky = currentWeatherData['weather'][0]['description'];
          final humidity = currentWeatherData['main']['humidity'];
          final windSpeed = currentWeatherData['wind']['speed'];
          final pressure = currentWeatherData['main']['pressure'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        cityName.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ))),
              Center(
                child: Text(
                  "$ctCel °C",
                  style: const TextStyle(fontSize: 80),
                ),
              ),
              Center(
                child: Text("$currentSky".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),

              // Forecast Text
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 64),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forecast",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(
                height: 161,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final time = DateTime.parse(data['list'][index]['dt_txt']);
                    final temp = data['list'][index]['main']['temp'];
                    final tempCel = (temp-273.15).round().toString();
                    return ForecastItem(
                      hour: DateFormat.j().format(time),
                      icon:
                          data['list'][index]['weather'][0]['main'] == 'Clouds'
                              ? Icons.cloud
                              : Icons.sunny,
                      temp: tempCel,
                    );
                  },
                ),
              ),

              //   Additional Weather Details
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 16),
                child: Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalItem(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: "$humidity"),
                  AdditionalItem(
                      icon: Icons.air,
                      label: "Wind Speed",
                      value: "$windSpeed"),
                  AdditionalItem(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: "$pressure"),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
