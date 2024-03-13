import 'package:file/file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_system.g.dart';

@Riverpod(dependencies: [])
external FileSystem fileSystem(FileSystemRef ref);
