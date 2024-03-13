import 'dart:io';

import 'package:cleanup_template/cleanup_template.dart' as cleanup_template;

void main() async {
  final status = await cleanup_template.run();

  return Future.wait([
    stdout.close(),
    stderr.close(),
  ]).then((_) => exit(status.code));
}
