# 課題の準備をする

課題をスムーズに進めるための準備をしましょう。

## 課題

- [ ] 作成した研修用のリポジトリにメンターを招待して、リポジトリへの書き込みアクセス権を付与
- [ ] 作成した研修用のリポジトリの GitHub Actions の権限を「Allow all actions and reusable workflows」に設定
- [ ] 作成した研修用のリポジトリの GitHub Actions のワークフローの権限を「Read and write permissions」に設定
- [ ] 作成した研修用のリポジトリに `main` ブランチの保護ルールを追加
- [ ] 使用しているチャットツールで GitHub 通知の購読設定
- [ ] 作成した研修用のリポジトリを `git clone [url]` して、ローカルにコピー
- [ ] [fvm] をインストール
- [ ] プロジェクトルートで `fvm install` コマンドを実行して対象の Flutter SDK をインストール
- [ ] IDE の最新安定板をインストール
- [ ] Flutter の設定（ `fvm flutter doctor` を実行して確認）
- [ ] Android・iOS でアプリを実行
- [ ] [review-assign.yaml] の `REVIEWERS` にメンターの GitHub のユーザー名を設定
- [ ] `.github/workflows-templates` ディレクトリを `.github/workflows` にリネーム
- [ ] プロジェクトのファイルを一通り見て、不要なコメントを削除

## 参考資料

- [リポジトリの GitHub Actions の設定を管理する]
- [GitHub + Slack]

<!-- Links -->

[fvm]: https://fvm.app/

[review-assign.yaml]: https://github.com/yumemi-inc/flutter-training-template/blob/main/.github/templates/.github/workflows/review-assign.yaml#L8

[リポジトリの GitHub Actions の設定を管理する]: https://docs.github.com/ja/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#allowing-select-actions-and-reusable-workflows-to-run

[GitHub + Slack]: https://slack.github.com
