# 課題の準備をする

課題をスムーズに進めるための準備をしましょう。

## 課題

- [ ] 作成した研修用のリポジトリにメンターを招待して、リポジトリへの書き込みアクセス権を付与
- [ ] 作成した研修用のリポジトリの GitHub Actions の権限を「Allow all actions and reusable workflows」に設定
- [ ] 作成した研修用のリポジトリの GitHub Actions のワークフローの権限を「Read and write permissions」に設定
- [ ] 作成した研修用のリポジトリに `main` ブランチの保護ルールを追加
  - [ ] マージ前にプルリクエスト必須
  - [ ] マージ前に１人の承認を必須
  - [ ] マージ前にステータスチェック必須
  - [ ] マージ前にブランチ最新化必須
  - [ ] マージ前に会話の解決必須
  - [ ] フォースプッシュを許可しない
  - [ ] 削除を許可しない
- [ ] 使用しているチャットツールで GitHub 通知の購読設定
  - Slackコマンド: `/github subscribe ユーザー名/リポジトリ名 issues pulls reviews comments`
- [ ] 作成した研修用のリポジトリを `git clone [url]` して、ローカルにコピー
- [ ] [fvm] をインストール
- [ ] プロジェクトルートで `fvm install` コマンドを実行して対象の Flutter SDK をインストール
- [ ] IDE の最新安定板をインストール
- [ ] Flutter の設定（ `fvm flutter doctor` を実行して確認）
- [ ] Android・iOS でアプリを実行
- [ ] `.github/workflows-templates` ディレクトリを `.github/workflows` にリネーム
- [ ] [review-assign.yaml] の `REVIEWERS` にメンターの GitHub のユーザー名を設定

## 参考資料

- [リポジトリの GitHub Actions の設定を管理する]
- [保護されたブランチについて]
- [GitHub + Slack]

<!-- Links -->

[fvm]: https://fvm.app/

[review-assign.yaml]: https://github.com/yumemi-inc/flutter-training-template/blob/main/.github/templates/.github/workflows-templates/review-assign.yaml#L8

[リポジトリの GitHub Actions の設定を管理する]: https://docs.github.com/ja/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#allowing-select-actions-and-reusable-workflows-to-run

[保護されたブランチについて]: https://docs.github.com/ja/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches

[GitHub + Slack]: https://slack.github.com
