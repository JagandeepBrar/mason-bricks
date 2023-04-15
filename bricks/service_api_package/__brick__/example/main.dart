import 'package:{{service.snakeCase()}}_api/{{service.snakeCase()}}_api.dart';

void main() async {
  // Set up the {{service.pascalCase()}} API
  final api = {{service.pascalCase()}}API({{service.pascalCase()}}Config(
  // TODO: Set default port correct
    host: '192.168.1.100:port',
  // TODO: Add additional config properties
  ));

  // Make API Calls
  // TODO: Add API call examples
}
