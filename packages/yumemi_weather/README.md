# yumemi_weather

A package that be used in [yumemi-inc/flutter-training] for getting pseudo weather forecast.

## Getting started

Add this package to your dependencies in `pubspec.yaml`:

```yaml
# https://dart.dev/tools/pub/dependencies#git-packages
dependencies:
  yumemi_weather:
    git:
      url: https://github.com/yumemi-inc/flutter-training.git
      ref: main
      path: packages/yumemi_weather
```

## Usage

```dart
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  final yumemiWeather = YumemiWeather();
  final weatherCondition = yumemiWeather.fetchSimpleWeather();
  print('Weather Condition: $weatherCondition'); // "sunny"
}
```

See [yumemi_weather_example.dart] for details.

<!-- Links -->

[yumemi-inc/flutter-training]: ../../README.md

[yumemi_weather_example.dart]: example/yumemi_weather_example.dart
