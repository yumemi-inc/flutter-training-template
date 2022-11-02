import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  final yumemiWeather = YumemiWeather();

  final simpleVer = yumemiWeather.fetchSimpleWeather();
  print('Weather Condition: $simpleVer');

  try {
    final throwsVer = yumemiWeather.fetchThrowsWeather('tokyo');
    print('Weather Condition: $throwsVer');
  } on YumemiWeatherError catch (e) {
    print('Throws: $e');
  }

  try {
    final jsonString = '''
{
    "area": "tokyo",
    "date": "2020-04-01T12:00:00+09:00"
}''';
    final weather = yumemiWeather.fetchWeather(jsonString);
    print('Weather: $weather');
  } on YumemiWeatherError catch (e) {
    print('Throws: $e');
  }
}
