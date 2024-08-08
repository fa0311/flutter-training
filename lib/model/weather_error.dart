class WeatherException implements Exception {}

class WeatherInvalidParameterException implements WeatherException {}

class WeatherUnknownException implements WeatherException {}

class WeatherInvalidResponseException implements WeatherException {
  const WeatherInvalidResponseException([this.message, this.log]);
  final String? message;
  final String? log;
}
