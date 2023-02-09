import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{service.snakeCase()}}_api/src/internal/mixins/serializable.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@Freezed()
class {{service.pascalCase()}}Config with _${{service.pascalCase()}}Config, JsonSerializableMixin {
  const {{service.pascalCase()}}Config._();

  const factory {{service.pascalCase()}}Config({
    required String host,
    Map<String, dynamic>? headers,
  }) = _{{service.pascalCase()}}Config;

  String get baseUrl {
    // TODO: Generate base URL to API path
    return host;
  }

  factory {{service.pascalCase()}}Config.fromJson(Map<String, Object?> json) =>
      _${{service.pascalCase()}}ConfigFromJson(json);
}
