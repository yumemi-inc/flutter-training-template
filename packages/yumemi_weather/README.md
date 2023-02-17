# yumemi_weather

A package that be used in [yumemi-inc/flutter-training-template] for getting pseudo weather forecast.

## Getting started

Add this package to your dependencies in `pubspec.yaml`:

```yaml
# https://dart.dev/tools/pub/dependencies#git-packages
dependencies:
  yumemi_weather:
    git:
      url: https://github.com/yumemi-inc/flutter-training-template.git
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

[yumemi-inc/flutter-training-template]: https://github.com/yumemi-inc/flutter-training-template

[yumemi_weather_example.dart]: https://github.com/yumemi-inc/flutter-training-template/blob/main/packages/yumemi_weather/example/yumemi_weather_example.dart
