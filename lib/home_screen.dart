import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_item.dart';
import 'package:weather_app/api.dart';
import 'package:weather_app/forecast_item.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = "";

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
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
                  "$currentTemp K",
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

              // Forecast Items
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 1; i < 10; i++) ...[
                      ForecastItem(
                          hour: data['list'][i]['dt_txt']
                              .toString()
                              .split(" ")[1]
                              .split(":")
                              .sublist(0, 2)
                              .join(":"),
                          icon:
                              data['list'][i]['weather'][0]['main'] == 'Clouds'
                                  ? Icons.cloud
                                  : Icons.sunny,
                          temp: "${data['list'][i]['main']['temp']} K"),
                    ],
                  ],
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
