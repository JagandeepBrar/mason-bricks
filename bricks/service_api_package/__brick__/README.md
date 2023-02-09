# {{service.titleCase()}} API

[![Pubdev][shield-pubdev]][link-pubdev]
![License][shield-license]

Dart library package providing an abstraction for [{{service.titleCase()}}][link-website]'s public API.

This package is intended to supply a 1:1 mapping of the [public API documentation][link-swagger] and does not make assumptions on orchestration to execute different workflows.

# Preparing {{service.titleCase()}}

> TODO: Add Preparation Docs

# Connecting to the API

All classes, models, and types are exported in the main package file:

```dart
import 'package:{{service.snakeCase()}}_api/{{service.snakeCase()}}_api.dart';
```

Now you can instantiate an instance of `{{service.pascalCase()}}Config` that is used to instantiate an instance of `{{service.pascalCase()}}API`:

```dart
final config = {{service.pascalCase()}}Config(
  // TODO: Set default port correct
  host: '192.168.1.100:port',
  // TODO: Add additional config properties
);
final api = {{service.pascalCase()}}API(config);
```

And you are ready to make API calls!

# Additional Notes

1. All available API methods can be viewed in the [generated Dart documentation][link-docs]
2. All models are immutable [freezed][link-freezed]-generated classes that can be modified using the `<model>.copyWith(...)` method
3. All models are JSON serializable using the `<model>.toJson()` method

[link-docs]: https://pub.dev/documentation/{{service.snakeCase()}}_api/latest/api/{{service.pascalCase()}}API-class.html
[link-freezed]: https://pub.dev/packages/freezed
[link-pubdev]: https://pub.dev/packages/{{service.snakeCase()}}_api
[link-swagger]: {{{api_docs}}}
[link-website]: {{{website}}}
[shield-license]: https://img.shields.io/github/license/RoninComputer/package-{{service.paramCase()}}-api?style=for-the-badge
[shield-pubdev]: https://img.shields.io/pub/v/{{service.snakeCase()}}_api.svg?style=for-the-badge
