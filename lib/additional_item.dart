import 'package:flutter/material.dart';

class AdditionalItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdditionalItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(label, style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 12),
            Icon( icon,size: 30),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
