import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_constants.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repository/weather_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
});

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return WeatherRepository(dio);
});

final weatherProvider = FutureProvider.family<Weather, String>((ref, city) {
  final repository = ref.watch(weatherRepositoryProvider);
  return repository.getWeather(city);
});