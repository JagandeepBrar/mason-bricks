import 'package:mason/mason.dart';

void run(HookContext context) {
  _setTypes(context);
}

void _setTypes(HookContext context) {
  context.vars['types'] = (context.vars['values'] as String)
      .split(',')
      .map((value) => <String, String>{'value': value.trim()})
      .toList();
  print(context.vars['types']);
}
