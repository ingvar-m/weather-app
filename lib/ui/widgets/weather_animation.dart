import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/weather_asset_mapper.dart';

class WeatherAnimation extends StatelessWidget {
  final String state;

  const WeatherAnimation({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      child: Lottie.asset(
        WeatherAssetMapper.getWeatherAnimation(state),
        width: 250,
        fit: BoxFit.contain,
      ),
    );
  }
}
