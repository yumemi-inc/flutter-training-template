/// https://dart.dev/tutorials/server/cmdline#setting-exit-codes
enum ExitStatus {
  success(0),
  warnings(1),
  errors(2),
  ;

  const ExitStatus(this.code);

  factory ExitStatus.fromCode(int code) => switch (code) {
        0 => ExitStatus.success,
        1 => ExitStatus.warnings,
        _ => ExitStatus.errors,
      };

  final int code;
}
