import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{service.snakeCase()}}_api/src/internal/mixins/serializable.dart';

part '{{name.snakeCase()}}.freezed.dart';
part '{{name.snakeCase()}}.g.dart';
{{#root_model}}
@Freezed()
class {{service.pascalCase()}}{{name.pascalCase()}} with _${{service.pascalCase()}}{{name.pascalCase()}}, JsonSerializableMixin {
  const factory {{service.pascalCase()}}{{name.pascalCase()}}({
    int? id,
    // TODO: Add model properties
  }) = _{{service.pascalCase()}}{{name.pascalCase()}};

  factory {{service.pascalCase()}}{{name.pascalCase()}}.fromJson(Map<String, Object?> json) =>
      _${{service.pascalCase()}}{{name.pascalCase()}}FromJson(json);
}{{/root_model}}{{^root_model}}
@Freezed()
class {{service.pascalCase()}}{{category.pascalCase()}}{{name.pascalCase()}} with _${{service.pascalCase()}}{{category.pascalCase()}}{{name.pascalCase()}}, JsonSerializableMixin {
  const factory {{service.pascalCase()}}{{category.pascalCase()}}{{name.pascalCase()}}({
    int? id,
    // TODO: Add model properties
  }) = _{{service.pascalCase()}}{{category.pascalCase()}}{{name.pascalCase()}};

  factory {{service.pascalCase()}}{{category.pascalCase()}}{{name.pascalCase()}}.fromJson(Map<String, Object?> json) =>
      _${{service.pascalCase()}}{{category.pascalCase()}}{{name.pascalCase()}}FromJson(json);
}{{/root_model}}
