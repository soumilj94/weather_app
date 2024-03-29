import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  const ForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Card(
        elevation: 4,
        color: Colors.white10,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 12),
          child: Column(
            children: [
              Text(
                "12:00",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 12),
              Icon(Icons.sunny, size: 40),
              SizedBox(height: 12),
              Text(
                "35",
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
