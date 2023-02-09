import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{service.snakeCase()}}_api/src/internal/mixins/serializable.dart';

@JsonEnum(valueField: 'name')
enum {{service.pascalCase()}}{{name.pascalCase()}} with EnumSerializableMixin {
  // TODO: Add types
  value('value');

  final String name;
  const {{service.pascalCase()}}{{name.pascalCase()}}(this.name);
}
