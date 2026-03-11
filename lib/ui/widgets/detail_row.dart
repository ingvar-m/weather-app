import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {

  final double windSpeed;
  final int humidity;

  const DetailRow({required this.windSpeed, required this.humidity,super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.air, size: 28, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  '${windSpeed.toString()} km/hr',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              'Wind',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(width: 80,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  size: 28,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  '${humidity.toString()}%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              'Humidity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
