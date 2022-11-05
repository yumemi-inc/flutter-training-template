import 'dart:convert';

import 'package:yumemi_weather/yumemi_weather.dart';
import 'package:test/test.dart';

void main() {
  final yumemiWeather = YumemiWeather();

  test('Simple Ver Test', () {
    for (final _ in List.generate(100, (index) => index)) {
      final simpleVer = yumemiWeather.fetchSimpleWeather();
      expect(simpleVer, anyOf('sunny', 'cloudy', 'rainy'));
    }
  });

  test('Throws Ver Test', () {
    for (final _ in List.generate(100, (index) => index)) {
      try {
        final simpleVer = yumemiWeather.fetchSimpleWeather();
        expect(simpleVer, anyOf('sunny', 'cloudy', 'rainy'));
      } catch (e) {
        expect(e, YumemiWeatherError.unknown);
      }
    }
  });

  group('JSON Ver Test', () {
    test('Success', () {
      for (final _ in List.generate(100, (index) => index)) {
        try {
          const jsonString = '''
{
    "area": "tokyo",
    "date": "2020-04-01T12:00:00+09:00"
}''';
          final weatherJson = yumemiWeather.fetchWeather(jsonString);
          final weather = jsonDecode(weatherJson);
          expect(
              weather['weather_condition'], anyOf('sunny', 'cloudy', 'rainy'));
          expect(weather['max_temperature'], inInclusiveRange(10, 40));
          expect(weather['min_temperature'],
              inInclusiveRange(-40, weather['max_temperature']));
          expect(weather['date'], '2020-04-01T12:00:00+09:00');
        } on YumemiWeatherError catch (e) {
          expect(e, YumemiWeatherError.unknown);
        }
      }
    });
    test('Failure', () {
      final notJsonString = 'not json';
      expect(
        () => yumemiWeather.fetchWeather(notJsonString),
        throwsA(YumemiWeatherError.invalidParameter),
      );
    });
  });
}
