import 'package:weather_app/models/weather.dart';
import 'package:dio/dio.dart';

import '../core/constants/app_constants.dart';

class WeatherRepository {

  final Dio _dio;

  WeatherRepository(this._dio);

  Future<Weather> getWeather(String city) async {
    try {
      final response = await _dio.get(
          '/weather',
        queryParameters: {
            'q': city,
            'appid': AppConstants.apiKey,
            'units': 'metric'
        }
      );
      return Weather.fromJson(response.data);
    } on DioException catch (e) {
      if(e.response?.statusCode == 404) {
        throw Exception('City not found');
      }
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('ERROR');
    }
  }

}