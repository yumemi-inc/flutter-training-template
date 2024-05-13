# 株式会社ゆめみ Flutter 研修

実務に近いかたちでアプリ開発を行いながら、Flutter でのアプリ開発の基礎復習、実務スキルを身に付けるための研修です。

## 概要

天気予報アプリを開発していただきます。

## 研修の流れ

### 研修用のリポジトリを作成

このリポジトリはテンプレートリポジトリに設定されています。

「Use this template」をタップして、ご自身の GitHub アカウントで研修用のリポジトリを作成してください。

ただし、リポジトリ名は「flutter-training-template」以外の名前にする必要があります。

<img src="docs/images/template.png" width="480" alt="template">

リポジトリが作成されたら、テンプレートのクリーンワークフローが自動実行されます。

テンプレートのクリーンワークフローでは次のことをしています。

- 各 Session を Issue に登録
- 各 Challenge を Issue に登録
- fvm を利用して、最新安定版の Flutter SDK で Android・iOS 用のプロジェクトを作成
- lints を導入
- [templates] 配下のファイルを上書きコピー
- 不要なファイルを削除してコミット作成してプッシュ

### 課題の進め方

1. 課題用のブランチを切って実施
   `session/{#}`
2. 完了したら Pull Request を作成し、レビュー依頼
   `main <-- session/{#}`
3. 承認されたらマージ
4. 次の課題を実施

全ての課題をクリアしたら修了です！

### レビュー待ちのとき

レビュー待ちの時は次の課題に先行着手しましょう。
`git rebase` コマンドを使ってみましょう。[^1]

Session1 がレビュー待ちの場合...

1. `session/1` ブランチから `session/2` を切る
2. Session2 を進める
3. `session/1` のマージ後、`session/2` を `main` で `rebase` する

[^1]: このようなケースで `rebase` コマンドを使うことが必ずしも正しいとは限りません。
どのような方法をとるかはチームで議論するべきと考えます。
ただ、この研修は「`rebase` コマンドを使ってみる」ことも研修の一部としています。

## 課題

### Session

- [Session0-Setup]
- [Session1-Layout]
- [Session2-API]
- [Session3-Lifecycle]
- [Session4-Mixin]
- [Session5-Error]
- [Session6-JSON]
- [Session7-Serialization]
- [Session8-StateManagement]
- [Session9-UnitTest]
- [Session10-WidgetTest]
- [Session11-ThreadBlock]

### Challenge

> **Warning**
> 作成中

## レビュー観点表

レビューを行う際に困ったときは、↓ のレビュー観点表をご利用ください。

[Flutter 研修課題のレビュー観点表]

## 貢献する方法

[貢献ガイド] をご確認ください。

<!-- Links -->

[templates]: .github/templates

[Session0-Setup]: docs/sessions/setup.md

[Session1-Layout]: docs/sessions/layout.md

[Session2-API]: docs/sessions/api.md

[Session3-Lifecycle]: docs/sessions/lifecycle.md

[Session4-Mixin]: docs/sessions/mixin.md

[Session5-Error]: docs/sessions/error.md

[Session6-JSON]: docs/sessions/json.md

[Session7-Serialization]: docs/sessions/serialization.md

[Session8-StateManagement]: docs/sessions/state_management.md

[Session9-UnitTest]: docs/sessions/unit_test.md

[Session10-WidgetTest]: docs/sessions/widget_test.md

[Session11-ThreadBlock]: docs/sessions/thread_block.md

[Flutter 研修課題のレビュー観点表]: https://yumemi.notion.site/Flutter-555155c98aea49f2bc745bbaff9d6ec7

[貢献ガイド]: docs/contributing/CONTRIBUTING.md
