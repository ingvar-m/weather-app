import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/extensions/date_extension.dart';
import 'package:weather_app/ui/screens/landscape_screen.dart';
import 'package:weather_app/ui/screens/portrait_screen.dart';
import 'package:weather_app/ui/widgets/update_button.dart';

import '../../providers/api_providers.dart';

class WeatherAppScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherStateProvider);
    String formattedDate = DateTime.now().toWeatherDate();
    final backgroundColor = ref.watch(themeColorProvider);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 24,
        title: Text(
            formattedDate,
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              fontWeight: FontWeight.w400
            )
        ),
        actions: [
          UpdateButton()
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: weatherAsync.when(
            data: (data) {
              final weather = data.weather;
              final location = data.location;
              return OrientationBuilder(
                builder: (context, orientation) {
                  return orientation == Orientation.portrait
                      ? _buildPortraitLayout(weather, location, formattedDate)
                      : _buildLandscapeLayout(weather, location, formattedDate);
                },
              );
            },
            error: (err, stack) => Center(
              child: Text(
                'Error: ${err}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            loading: () => Center(
              child: const CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout(weather, location, String date) {
    return PortraitScreen(weather: weather, location: location, date: date);
  }

  Widget _buildLandscapeLayout(weather, location, String date) {
    return LandscapeScreen(weather: weather, location: location, date: date);
  }
}
