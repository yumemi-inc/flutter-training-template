# StatefulWidget のライフサイクル

Flutter の [StatefulWidget] にも、iOS の [UIViewController] や Android の [Activity] のようなライフサイクルがあります。

iOS・Android と異なる点があるため、きちんと確認しておきましょう。

## 課題

- [StatefulWidget] を継承した Widget で構築された新しい画面を追加する
- 新しい画面の背景色は [`Colors.green`] に設定する
- アプリ起動時に新しい画面に遷移する
- 新しい画面が表示されたら、0.5 秒後に前回まで作っていた画面に遷移する
- 前回まで作っていた画面の Close ボタンをタップすると画面を閉じる

## 動作イメージ

![demo]

## ヒント

[WidgetsBinding.instance.endOfFrame] を利用すると、画面のレイアウトの計算が終わって描画されはじめたタイミングで処理を実行することができます。

画面遷移は外部パッケージを利用しても問題ありませんが、本課題では [Navigator] の命令型 API を利用すると比較的簡単に実装できます。

### 参考資料

- [How do I listen to iOS lifecycle events?]
- [How do I listen to Android activity lifecycle events?]
- [‘addPostFrameCallback’ vs. ‘endOfFrame.then’ in WidgetsBinding with Rendering.]

<!-- Links -->

[StatefulWidget]: https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html

[UIViewController]: https://developer.apple.com/documentation/uikit/uiviewcontroller

[Activity]: https://developer.android.com/guide/components/activities/activity-lifecycle

[`Colors.green`]: https://api.flutter.dev/flutter/material/Colors/green-constant.html

[demo]: https://github.com/yumemi-inc/flutter-training-template/blob/main/docs/sessions/images/lifecycle/demo.gif?raw=true

[WidgetsBinding.instance.endOfFrame]: https://api.flutter.dev/flutter/scheduler/SchedulerBinding/endOfFrame.html

[Navigator]: https://api.flutter.dev/flutter/widgets/Navigator-class.html

[How do I listen to iOS lifecycle events?]: https://docs.flutter.dev/get-started/flutter-for/uikit-devs#listening-to-lifecycle-events

[How do I listen to Android activity lifecycle events?]: https://docs.flutter.dev/get-started/flutter-for/android-devs#how-do-i-listen-to-android-activity-lifecycle-events

[‘addPostFrameCallback’ vs. ‘endOfFrame.then’ in WidgetsBinding with Rendering.]: https://medium.com/@ahmeddhus/addpostframecallback-vs-endofframe-then-in-widgetsbinding-with-rendering-a8ed5d527669
