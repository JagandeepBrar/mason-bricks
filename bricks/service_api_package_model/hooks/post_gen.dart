import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  _updateCanonicalExport(context);
}

void _updateCanonicalExport(HookContext context) {
  context.logger.info('Updating canonical models export...');

  final path = 'lib/models.dart';
  final file = File(path);

  if (!file.existsSync()) {
    context.logger.warn('${path} does not exist. Skipping...');
    return;
  }

  final models = _getModelList(context);
  if (models.length > 0) {
    _writeFile(context, models);
  }
}

void _writeFile(HookContext context, List<String> models) {
  final path = 'lib/models.dart';
  final file = File(path);

  String data = 'library models;\n\n';
  models.forEach((model) {
    data += "export '$model';\n";
  });

  file.writeAsStringSync(data);
}

List<String> _getModelList(HookContext context) {
  final path = 'lib/src/models';
  final directory = Directory(path);

  if (!directory.existsSync()) {
    context.logger.warn('${path} does not exist. Skipping...');
    return [];
  }

  final list = directory.listSync(recursive: true);
  final results = <String>[];

  list.forEach((entity) {
    if (_isValidModelFile(entity.path)) {
      results.add(entity.path.substring('lib/'.length));
    }
  });

  results.sort();
  return results;
}

bool _isValidModelFile(String path) {
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
