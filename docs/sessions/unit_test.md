# [Unit tests] を書く

Flutter のテストは次の３つに分類されます。

- [Unit tests]
- [Widget tests]
- [Integration tests]

[Unit tests] は、他のテストより依存関係を少なくすることができるため、実装やメンテナンスコストを低く抑えることができます。

実際に [Unit tests] を書いていきましょう。

## 課題

- [yumemi_weather] API の呼び出しから Widget へ通知する部分までの [Unit tests] を書く
    - 依存しているものが、成功・失敗するケースも網羅する
- 余力があれば、JSON のエンコード・デコードの [Unit tests] も書く

※ テストコードを書くにあたって、依存関係を見直すなどのリファクタリングを行っても問題ありません。

## ヒント

テストを書くときは、依存しているものは何で、前提条件と完了条件は何なのかを明確にすることが重要です。

また、[mockito | REAMDME] を使って依存しているものをモックすることで、様々なテストケースに柔軟かつ簡単に対応できるようになります。

## 参考資料

- [Testing your providers]

<!-- Links -->

[Unit tests]: https://docs.flutter.dev/testing#unit-tests

[Widget tests]: https://docs.flutter.dev/testing#widget-tests

[Integration tests]: https://docs.flutter.dev/testing#integration-tests

[yumemi_weather]: https://yumemi-inc.github.io/flutter-training-template/

[mockito | REAMDME]: https://pub.dev/packages/mockito

[Testing your providers]: https://riverpod.dev/docs/essentials/testing
