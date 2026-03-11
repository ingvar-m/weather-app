extension DateFormatter on DateTime {

  String toWeatherDate() {
    return '${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}/$year';
  }

}