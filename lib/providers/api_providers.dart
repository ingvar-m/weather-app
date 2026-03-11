import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_constants.dart';
import 'package:weather_app/models/location_data.dart';
import 'package:weather_app/providers/location_provider.dart';
import 'package:weather_app/repository/weather_repository.dart';

import '../models/weather.dart';

final dioProvider = Provider(
  (ref) => Dio(BaseOptions(baseUrl: AppConstants.baseUrl)),
);

final weatherRepositoryProvider = Provider(
  (ref) => WeatherRepository(ref.watch(dioProvider)),
);

final weatherStateProvider =
    FutureProvider<({Weather weather, LocationData? location})>((ref) async {
      ref.keepAlive();

      final timer = Timer(
        const Duration(minutes: 15),
        () => ref.invalidateSelf(),
      );
      ref.onDispose(() => timer.cancel());

      final locationAsync = await ref.watch(locationProvider.future);
      final location =
          locationAsync ?? LocationData(city: 'London', country: 'UK');

      final repo = ref.read(weatherRepositoryProvider);
      final weather = await repo.getWeather(location.city);

      return (weather: weather, location: location);
    });

final themeColorProvider = Provider<Color>((ref) {
  final weatherAsync = ref.watch(weatherStateProvider);

  return weatherAsync.maybeWhen(
    data: (data) {
      final condition = data.weather.state.toLowerCase();
      switch (condition) {
        case 'clear':
          return Colors.orange;
        case 'clouds':
          return Colors.blueGrey;
        case 'rain':
        case 'drizzle':
        case 'thunderstorm':
          return Colors.indigo;
        case 'snow':
          return Colors.lightBlue;
        case 'mist':
        case 'smoke':
        case 'haze':
        case 'fog':
          return Colors.grey;
        default:
          return Colors.blue;
      }
    },
    orElse: () => Colors.blue,
  );
});
