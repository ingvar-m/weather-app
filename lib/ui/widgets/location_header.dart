import 'package:flutter/material.dart';

class LocationHeader extends StatelessWidget {
  final String city;
  final String country;

  const LocationHeader({required this.city, required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: '${country},\n',
        style: TextStyle(
            fontSize: 20,
          height: 1
        ),
        children: <TextSpan>[
          TextSpan(
            text: city,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
