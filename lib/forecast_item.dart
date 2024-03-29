import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  final String hour;
  final IconData icon;
  final String temp;

  const ForecastItem({
    super.key,
    required this.hour,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Card(
        elevation: 4,
        color: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
          child: Column(
            children: [
              Text(hour,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 12),
              Icon(icon, size: 40),
              const SizedBox(height: 12),
              Text(
                temp,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}