import 'package:flutter/material.dart';

import '../../models/location_data.dart';
import '../../models/weather.dart';
import '../widgets/detail_row.dart';
import '../widgets/location_header.dart';
import '../widgets/temperature_display.dart';
import '../widgets/weather_animation.dart';

class LandscapeScreen extends StatelessWidget {
  final Weather weather;
  final LocationData location;
  final String date;

  const LandscapeScreen({
    required this.weather,
    required this.location,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 2),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            LocationHeader(
              city: location.city ,
              country: location.country,
            ),
            const Spacer(flex: 2),
            DetailRow(windSpeed: weather.windSpeed, humidity: weather.humidity),
            const Spacer(flex: 1),
          ],
        ),
        const Spacer(flex: 1),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: WeatherAnimation(state: weather.state),
            ),
            const Spacer(flex: 1),
            TemperatureDisplay(
              temperature: weather.temperature,
              state: weather.state,
              isLandscape: true,
            ),
            const Spacer(flex: 4),
          ],
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
