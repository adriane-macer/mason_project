import 'package:get_it/get_it.dart';

import 'auth_service.dart';
import 'auth_service_impl.dart';
import 'fake_auth_service_impl.dart';



void setupAuth({bool useFake = false}) {
  if (useFake) {
    sl.registerLazySingleton<{{service_name.pascalCase()}}Service>(
            () => Fake{{service_name.pascalCase()}}ServiceImpl(),
  );
  } else {
  sl.registerLazySingleton<{{service_name.pascalCase()}}Service>(
  () => AuthServiceImpl(),
  );
  }
}