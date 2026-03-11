import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/location_data.dart';
import 'package:weather_app/services/location_service.dart';

final locationProvider = FutureProvider<LocationData?>((ref) async {
  ref.keepAlive();
  final locationService = LocationService();
  return await locationService.getCurrentLocationInfo();
});