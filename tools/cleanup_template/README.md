# CLI to Cleanup flutter-training-template

This CLI is run when a new repository is created from flutter-training-template.

This CLI provides an environment for receiving Flutter training.

## Get Started

### 1. Install Dart SDK

Before using this tool, make sure you have the Dart SDK installed. You can follow the instructions in the official documentation to install the Dart SDK and set up the dart command:

[Install Dart SDK]

> **Note**
> Ensure that your Dart SDK version is 3.3.0.

### 2. Install Dependencies

After installing the Dart SDK, you need to install the project dependencies using the following command:

```shell
dart pub get
```

## Usage

> **Note**
> This package is intended for use exclusively within the GitHub Actions workflow of [yumemi-inc/flutter-training-template] and is not published on [Pub.dev].

To run cleanup_template, execute the following command:

```shell
dart run bin/cleanup_template.dart
```

<!-- Links -->

[Install Dart SDK]: https://dart.dev/get-dart
[yumemi-inc/flutter-training-template]: https://github.com/yumemi-inc/flutter-training-template
[Pub.dev]: https://pub.dev/
