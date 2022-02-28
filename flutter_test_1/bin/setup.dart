import 'dart:async';
import 'dart:io';

import 'package:wasm/src/shared.dart';

final workingDirectory = Uri.file(Platform.script.path).resolve('..');

Future<int> _runFlutter(List<String> args) async {
  print('flutter ${args.join(' ')}');
  final process = await Process.start(
    'flutter',
    args,
    workingDirectory: workingDirectory.toFilePath(),
  );
  unawaited(stdout.addStream(process.stdout));
  unawaited(stderr.addStream(process.stderr));
  return process.exitCode;
}

Future<void> main(List<String> args) async {
  final outDir = libBuildOutDir(Directory.current.uri).toFilePath();
  exitCode = await _runFlutter(['pub', 'get']);
  if (exitCode != 0) return;
  exitCode =
      await _runFlutter(['pub', 'run', 'wasm:setup', '-o', outDir, ...args]);
}
