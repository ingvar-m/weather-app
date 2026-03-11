import 'package:flutter/material.dart';

class TemperatureDisplay extends StatelessWidget {
  final double temperature;
  final String state;
  final bool isLandscape;

  const TemperatureDisplay({
    required this.temperature,
    required this.state,
    required this.isLandscape,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${temperature.round()}°C',
          style: TextStyle(
            color: Colors.white,
            fontSize: isLandscape ? 40 : 56,
            fontWeight: FontWeight.bold,
            height: 1
          ),
        ),
        const SizedBox(height: 4,),
        Text(
          '${state}',
          style: TextStyle(
            color: Colors.white,
            fontSize: isLandscape ? 24 : 32,
            fontWeight: FontWeight.w600,
            height: 1
          ),
        ),
      ],
    );
  }
}
