import 'package:flutter/material.dart';
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
                ForecastItem(),
                ForecastItem(),
                ForecastItem(),
                ForecastItem(),
                ForecastItem(),
                ForecastItem(),
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
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      children: [
                        const Text("Humidity", style: TextStyle(fontSize: 20),),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.water_drop,size: 30),),
                        const Text("99", style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
