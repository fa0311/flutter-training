class WeatherException implements Exception {}

class WeatherInvalidParameterException implements WeatherException {}

class WeatherUnknownException implements WeatherException {}

class WeatherInvalidResponseException implements WeatherException {
  const WeatherInvalidResponseException([this.message, this.source]);
  final String? message;
  final String? source;
}
