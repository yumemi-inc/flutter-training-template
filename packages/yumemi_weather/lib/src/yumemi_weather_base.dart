import 'dart:convert';
import 'dart:io';
import 'dart:math';

class Request {
  Request({
    required this.area,
    required this.date,
  });

  final String area;
  final DateTime date;

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      area: json['area'] as String,
      date: DateTime.parse(json['date'] as String),
    );
  }
}

class Response {
  Response({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  final WeatherCondition weatherCondition;
  final int maxTemperature;
  final int minTemperature;
  final DateTime date;

  Map<String, dynamic> toJson() {
    final dateText =
        '${date.year.padLeft(4)}-${date.month.padLeft(2)}-${date.day.padLeft(2)}';
    final timeText =
        '${date.hour.padLeft(2)}:${date.minute.padLeft(2)}:${date.second.padLeft(2)}';

    final timeZoneOffset = date.timeZoneOffset;
    final timeZoneSign = timeZoneOffset.isNegative ? '-' : '+';
    final timeZoneText = '$timeZoneSign${timeZoneOffset.inHours.padLeft(2)}:00';
    return {
      'weather_condition': weatherCondition.name,
      'max_temperature': maxTemperature,
      'min_temperature': minTemperature,
      'date': '${dateText}T$timeText$timeZoneText',
    };
  }
}

enum WeatherCondition {
  sunny,
  cloudy,
  rainy,
}

enum YumemiWeatherError {
  invalidParameter,
  unknown,
}

extension RandomExt on Random {
  int range(int min, int max) => min + nextInt(1 + max - min);
}

extension IntExt on int {
  String padLeft(int width, [String padding = '0']) {
    return toString().padLeft(width, padding);
  }
}

const apiDuration = Duration(seconds: 2);

class YumemiWeather {
  Response _makeRandomResponse({
    WeatherCondition? weatherCondition,
    int? maxTemperature,
    int? minTemperature,
    DateTime? date,
  }) {
    final seed = Random().range(0, 100);
    final random = Random(seed);
    final randomWeather = weatherCondition ??
        WeatherCondition.values[random.nextInt(WeatherCondition.values.length)];
    final randomMaxTemperature = maxTemperature ?? random.range(10, 40);
    final randomMinTemperature =
        minTemperature ?? random.range(-40, randomMaxTemperature);
    final randomDate = date ?? DateTime.now();
    return Response(
      weatherCondition: randomWeather,
      maxTemperature: randomMaxTemperature,
      minTemperature: randomMinTemperature,
      date: randomDate.toLocal(),
    );
  }

  /// Pseudo Weather Forecast API simple ver
  ///
  /// Randomly returns `sunny`, `cloudy`, or `rainy`. For example:
  ///
  /// ```dart
  /// final weatherCondition = YumemiWeather().fetchSimpleWeather();
  /// print(weatherCondition); // "sunny"
  /// ```
  String fetchSimpleWeather() {
    return _makeRandomResponse().weatherCondition.name;
  }

  /// Pseudo Weather Forecast API throws ver
  ///
  /// Set [area] to the area for which you want to get a weather forecast.
  /// Randomly throws `YumemiWeatherError.unknown` or returns `sunny`, `cloudy`,
  /// or `rainy`. For example:
  ///
  /// ```dart
  /// final weatherCondition = YumemiWeather().fetchThrowsWeather('tokyo');
  /// print(weatherCondition); // "sunny"
  /// ```
  String fetchThrowsWeather(String area) {
    final randomInt = Random().range(0, 4);
    if (randomInt == 4) {
      throw YumemiWeatherError.unknown;
    }
    return _makeRandomResponse().weatherCondition.name;
  }

  /// Pseudo Weather Forecast API JSON ver
  ///
  /// Set [jsonString] to the JSON string containing the area and datetime for
  /// which you want to get a weather forecast.
  /// If the parsing fails, throw `YumemiWeatherError.invalidParameter`.
  /// Randomly throws `YumemiWeatherError.unknown` or returns the JSON string
  /// with weather forecast information. For example:
  ///
  /// ```dart
  /// const jsonString = '''
  /// {
  ///     "area": "tokyo",
  ///     "date": "2020-04-01T12:00:00+09:00"
  /// }''';
  /// final weatherJson = YumemiWeather().fetchWeather(jsonString);
  /// print(weatherJson); // "{"weather_condition":"cloudy","max_temperature":25,"min_temperature":7,"date":"2020-04-01T12:00:00+09:00"}"
  /// ```
  String fetchWeather(String jsonString) {
    final Request request;
    try {
      final json = jsonDecode(jsonString);
      request = Request.fromJson(json);
    } catch (_) {
      throw YumemiWeatherError.invalidParameter;
    }

    final randomInt = Random().range(0, 4);
    if (randomInt == 4) {
      throw YumemiWeatherError.unknown;
    }
    final response = _makeRandomResponse(date: request.date);
    return jsonEncode(response);
  }

  String syncFetchWeather(String jsonString) {
    sleep(apiDuration);
    return fetchWeather(jsonString);
  }
}
