class Weather {
  final double temperature;
  final String state;
  final int humidity;
  final double windSpeed;

  Weather({required this.temperature,
    required this.state,
    required this.humidity,
    required this.windSpeed});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temperature: json['main']['temp'].toDouble(),
        state: json['weather'][0]['main'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'].toDouble()
    );
  }

}
