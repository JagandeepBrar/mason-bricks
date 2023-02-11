import 'package:mason/mason.dart';

void run(HookContext context) {
  _setIsRootModel(context);
}

void _setIsRootModel(HookContext context) {
  context.vars['root_model'] = context.vars['category'] == context.vars['name'];
}
