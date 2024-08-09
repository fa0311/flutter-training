class WeatherException implements Exception {
  const WeatherException([this.message, this.source]);
  final String? message;
  final String? source;
}

class WeatherInvalidParameterException extends WeatherException {
  const WeatherInvalidParameterException([super.message, super.source]);
}

class WeatherUnknownException extends WeatherException {
  const WeatherUnknownException([super.message, super.source]);
}

class WeatherInvalidResponseException extends WeatherException {
  const WeatherInvalidResponseException([super.message, super.source]);
}
