# API のエラーハンドリング

[yumemi_weather] の API のエラーを補足して、ダイアログを表示しましょう。

## 課題

- 使用する API を `fetchSimpleWeather()` から `fetchThrowsWeather()` に変更する
- API のエラーを補足して、エラーの内容に応じて [AlertDialog] でメッセージを表示する
    - メッセージの内容は自由
- [AlertDialog] の OK ボタンをタップすると、ダイアログを閉じる

## 動作イメージ

※ エラーメッセージは仮で設定しています。

![demo]

## ヒント

天気予報ページと天気予報パネルの状態をそれぞれ別で考えると整理しやすくなるかもしれません。

<!-- Links -->

[yumemi_weather]: https://yumemi-inc.github.io/flutter-training-template/

[AlertDialog]: https://api.flutter.dev/flutter/material/AlertDialog-class.html

[demo]: https://github.com/yumemi-inc/flutter-training-template/blob/main/docs/sessions/images/error/demo.gif?raw=true
