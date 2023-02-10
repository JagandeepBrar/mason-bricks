import 'dart:io';
import 'package:mason/mason.dart';

void updateBarrelExport(HookContext context, String name) {
  final state = context.logger.progress('Updating barrel export file...');
  final path = 'lib/$name.dart';
  final file = File(path);

  if (!file.existsSync()) {
    final create = context.logger.progress('$path does not exist. Creating...');
    file.createSync();
    create.complete();
  }

  final files = _getFileList(context, name);
  if (files.length > 0) {
    _writeFile(context, name, files);
  }

  state.complete('Updated barrel export file.');
}

void _writeFile(HookContext context, String name, List<String> files) {
  final path = 'lib/$name.dart';
  final file = File(path);

  String data = 'library $name;\n\n';
  files.forEach((file) => data += "export '$file';\n");

  file.writeAsStringSync(data);
}

List<String> _getFileList(HookContext context, String name) {
  final path = 'lib/src/$name';
  final directory = Directory(path);

  if (!directory.existsSync()) {
    return [];
  }

  final list = directory.listSync(recursive: true);
  final results = <String>[];

  list.forEach((entity) {
    if (_isValidFile(entity.path)) {
      results.add(entity.path.substring('lib/'.length));
    }
  });

  results.sort();
  return results;
}

bool _isValidFile(String path) {
  if (path.endsWith('.dart')) {
    if (path.endsWith('.g.dart')) {
      return false;
    }

    if (path.endsWith('.freezed.dart')) {
      return false;
    }

    return true;
  }

  return false;
}
