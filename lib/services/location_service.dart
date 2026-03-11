import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/location_data.dart';

class LocationService {
  Future<LocationData?> _getLocationFromCoords(double lat, lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        return LocationData(
          city: place.locality ?? place.subAdministrativeArea ?? 'Unknown city',
          country: place.country ?? 'Unknown country',
        );
      }
    } catch (e) {
      throw Exception('Geocoding error: $e');
    }
    return null;
  }

  Future<LocationData?> getCurrentLocationInfo() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) return null;

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse &&
          permission == LocationPermission.always)
        return null;
    }

    Position position = await Geolocator.getCurrentPosition();
    return await _getLocationFromCoords(position.latitude, position.longitude);
  }
}
