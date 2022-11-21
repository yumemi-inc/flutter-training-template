# Mixin パターン

Dart には [Mixin] という機能があり、公式パッケージから [AutomaticKeepAliveClientMixin] や [TextSelectionDelegate] などの便利なものがいくつか提供されています。

実際に [Mixin] を作成して使ってみましょう。

## 課題

- レイアウトが表示された後に「何かしらの処理」を行う [Mixin] を作成する
- 作成した [Mixin] の使用先で「何かしらの処理」を記述できるようにする
- [Session3] で作成した以下の処理を作成した [Mixin] を使って書き直す
  > 新しい画面が表示されたら、0.5 秒後に前回まで作っていた画面に遷移する

## ヒント

`on` キーワードによって [Mixin] の使用を制限することができます。

さらに、`on` キーワードで指定したクラスのメソッドをオーバーライドすることもできます。

## 参考資料

### Mixin とは

> Mixin または Mix-in（ミックスイン）は、オブジェクト指向プログラミングで用いられる技法であり、他のクラスから
> 使用されるメソッド群を持つクラスが、他のクラスのスーパークラスにならないで済むための、特別な多重継承関係を
> 実現するためのメカニズムを意味している。Mix-in されたメソッドに、他のクラスがアクセスする方法はそれぞれの
> 言語仕様に依存している。
>
> Mix-in はコードの再利用性を促進し、従来のクラスの多重継承がもたらしていた菱形継承などの数々の問題を回避する。
> 多重継承を採用していない言語においては、多重継承と類似の機能性をより堅牢にして提供する。
> 依存性逆転の原則のデザインパターンにも応用されている。

出典: [フリー百科事典『ウィキペディア（Wikipedia）』]

### Mixin の採用言語例

- [Scala] - トレイト
- [Ruby] - モジュール
- [Kotlin] - インターフェース
- [Swift] - プロトコル
- [JavaScript] - 関数オブジェクト

<!-- Links -->

[Mixin]: https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins

[AutomaticKeepAliveClientMixin]: https://api.flutter.dev/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html

[TextSelectionDelegate]: https://api.flutter.dev/flutter/services/TextSelectionDelegate-mixin.html

[Session3]: 4

[フリー百科事典『ウィキペディア（Wikipedia）』]: https://ja.wikipedia.org/wiki/Mixin

[Scala]: https://docs.scala-lang.org/tour/mixin-class-composition.html

[Ruby]: https://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html

[Kotlin]: https://kotlinlang.org/docs/interfaces.html

[Swift]: https://docs.swift.org/swift-book/LanguageGuide/Protocols.html

[JavaScript]: https://javascript.info/mixins
