# シリアル化する

多くのアプリでは外部 API とのやりとりが行われます。

そして、多くの場合データの受け渡しは JSON が使われます。

Dart にはデフォルトで [JSON を変換する仕組み] が用意されていますが、独自に作成したクラスへ変換しようとすると、自分で `fromJson()` や `toJson()`
を実装しなければならずコストがかかってしまい、さらにリスクも高くなってしまいます。

そこで、公式からは [json_serializable] というパッケージが紹介されています。

## 課題

- [json_serializable] を利用して、独自のクラスから API のリクエストを作成する
- [json_serializable] を利用して、API のレスポンスを独自のクラスに変換する

※ [freezed] を利用しても問題ありません

## ヒント

[build.yaml] を作成すると、一括で様々な設定ができます。

## 参考資料

IDE の機能をうまく活用すると、素早くクラスを作成できるためおすすめです。

### Visual Studio Code

- [Extension]
- [Snippets]

### JetBrains IDEs

- [Plugins]
- [Live templates]

<!-- Links -->

[JSON を変換する仕組み]: https://dart.dev/guides/libraries/library-tour#dartconvert---decoding-and-encoding-json-utf-8-and-more

[json_serializable]: https://pub.dev/packages/json_serializable

[freezed]: https://pub.dev/packages/freezed

[build.yaml]: https://github.com/google/json_serializable.dart/tree/master/json_serializable#build-configuration

[Extension]: https://code.visualstudio.com/docs/editor/extension-marketplace

[Snippets]: https://code.visualstudio.com/docs/editor/userdefinedsnippets

[Plugins]: https://pleiades.io/help/idea/managing-plugins.html

[Live templates]: https://www.jetbrains.com/help/idea/using-live-templates.html
