class WeatherException implements Exception {
  const WeatherException([this.message, this.source]);
  final String? message;
  final String? source;
}

class WeatherInvalidParameterException implements WeatherException {
  const WeatherInvalidParameterException([this.message, this.source]);
  @override
  final String? message;
  @override
  final String? source;
}

class WeatherUnknownException implements WeatherException {
  const WeatherUnknownException([this.message, this.source]);
  @override
  final String? message;
  @override
  final String? source;
}

class WeatherInvalidResponseException implements WeatherException {
  const WeatherInvalidResponseException([this.message, this.source]);
  @override
  final String? message;
  @override
  final String? source;
}
