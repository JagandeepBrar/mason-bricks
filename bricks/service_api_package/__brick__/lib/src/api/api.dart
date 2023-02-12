import 'package:dio/dio.dart';
import 'package:{{service.snakeCase()}}_api/api.dart';
import 'package:{{service.snakeCase()}}_api/models.dart';
import 'package:{{service.snakeCase()}}_api/types.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class {{service.pascalCase()}}API {
  factory {{service.pascalCase()}}API({{service.pascalCase()}}Config config) {
    Dio dio = Dio(config.baseOptions);
    return _{{service.pascalCase()}}API(dio);
  }
}
