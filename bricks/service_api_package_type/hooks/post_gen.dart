import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  _updateCanonicalExport(context);
}

void _updateCanonicalExport(HookContext context) {
  context.logger.info('Updating canonical types export...');

  final path = 'lib/types.dart';
  final file = File(path);

  if (!file.existsSync()) {
    context.logger.warn('${path} does not exist. Skipping...');
    return;
  }

  final types = _getTypesList(context);
  if (types.length > 0) {
    _writeFile(context, types);
  }
}

void _writeFile(HookContext context, List<String> types) {
  final path = 'lib/types.dart';
  final file = File(path);

  String data = 'library types;\n\n';
  types.forEach((type) {
    data += "export '$type';\n";
  });

  file.writeAsStringSync(data);
}

List<String> _getTypesList(HookContext context) {
  final path = 'lib/src/types';
  final directory = Directory(path);

  if (!directory.existsSync()) {
    context.logger.warn('${path} does not exist. Skipping...');
    return [];
  }

  final list = directory.listSync(recursive: true);
  final results = <String>[];

  list.forEach((entity) {
    if (_isValidTypeFile(entity.path)) {
      results.add(entity.path.substring('lib/'.length));
    }
  });

  results.sort();
  return results;
}

bool _isValidTypeFile(String path) {
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
