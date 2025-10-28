export 'data/repositories/i_{{name.snakeCase()}}_repository.dart';
export 'data/repositories/{{name.snakeCase()}}_fake_repository.dart';
export 'data/repositories/{{name.snakeCase()}}_remote_repository.dart';
export 'logic/{{name.snakeCase()}}_cubit.dart';
export 'data/models/{{return_class.snakeCase()}}_model.dart';
export 'data/entities/{{return_class.snakeCase()}}_entity.dart';
export 'data/storage/cached_timer/{{return_class.snakeCase()}}_cached_timer.dart';
export 'data/storage/{{return_class.snakeCase()}}_hive_service.dart';