import 'package:flutter/material.dart';
import 'package:weather_app/additional_item.dart';
import 'package:weather_app/forecast_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Indore",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ))),
          const Center(
            child: Text(
              "34",
              style: TextStyle(fontSize: 100),
            ),
          ),
          const Center(
            child: Text(
              "Sunny",
              style: TextStyle(fontSize: 24),
            ),
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
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ForecastItem(hour: "12:00", icon: Icons.sunny, temp: "35"),
                ForecastItem(hour: "13:00", icon: Icons.sunny, temp: "35"),
                ForecastItem(hour: "14:00", icon: Icons.cloud, temp: "36"),
                ForecastItem(hour: "15:00", icon: Icons.cloud, temp: "38"),
                ForecastItem(hour: "16:00", icon: Icons.sunny, temp: "37"),
                ForecastItem(hour: "17:00", icon: Icons.cloud, temp: "35"),
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

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AdditionalItem(icon: Icons.water_drop,label: "Humidity", value: "99"),
              AdditionalItem(icon: Icons.air, label: "Wind Speed", value: "124",),
              AdditionalItem(icon: Icons.beach_access, label: "Pressure", value: "87"),
            ],
          ),
        ],
      ),
    );
  }
}
