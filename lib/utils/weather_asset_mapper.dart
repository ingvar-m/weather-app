class WeatherAssetMapper {

  static const String _path = 'assets/animations/';

  static const Map<String, String> _assets = {
    'clear': 'clear.json',
    'clouds': 'clouds.json',
    'mist': 'mist.json',
    'fog': 'mist.json',
    'smoke': 'mist.json',
    'rain': 'rain.json',
    'drizzle': 'rain.json',
    'snow': 'snow.json',
    'thunderstorm': 'thunderstorm.json'
  };

  static String getWeatherAnimation(String? condition) {
    if(condition == null) return "${_path}default.json";
    return _path + (_assets[condition.toLowerCase()] ?? 'default.json');
  }

}