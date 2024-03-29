import 'package:flutter/material.dart';

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
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 64),
            child: Align(alignment: Alignment.centerLeft,
              child: Text(
                "Forecast",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Card(
            child: Placeholder(fallbackHeight: 200),
          ),
        ],
      ),
    );
  }
}
