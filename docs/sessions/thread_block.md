# スレッドブロック

時間のかかる処理を扱ってみましょう。

## 課題

- 使用する API を `fetchWeather()` から `syncFetchWeather()` に変更する
- API の処理が戻るまで [CircularProgressIndicator] を表示する

## 動作イメージ

![demo]

## ヒント

Dart の実行モデルはシングルスレッド・イベントループです。

そのため、そのままだと画面が固まってしまい [CircularProgressIndicator] は表示されません。

よって、このようにスレッドをブロックしてしまうような処理の場合は [isolates] を使用します。

## 参考資料

- [Flutter で Isolate を用いた並列処理をするべきシーンとそのやり方]

<!-- Links -->

[CircularProgressIndicator]: https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html

[demo]: https://github.com/yumemi-inc/flutter-training-template/blob/main/docs/sessions/images/thread_block/demo.gif?raw=true

[isolates]: https://dart.dev/guides/language/concurrency#how-isolates-work

[Flutter で Isolate を用いた並列処理をするべきシーンとそのやり方]: https://medium.com/flutter-jp/isolate-a3f6eab488b5
