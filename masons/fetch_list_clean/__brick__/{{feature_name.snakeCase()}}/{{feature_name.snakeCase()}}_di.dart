import '{{feature_name.snakeCase()}}_barrel.dart';

void setUp{{feature_name.pascalCase()}}DI(){
  _register{{feature_name.camelCase()}}();
  sl.registerFactory< {{feature_name.pascalCase()}}Repository>(
        () => {{feature_name.pascalCase()}}RepositoryImpl(sl()),
  );
  sl.registerFactory<{{feature_name.pascalCase()}}UseCase>(() => {{feature_name.pascalCase()}}UseCase(sl()));
  sl.registerFactory<{{feature_name.pascalCase()}}Cubit>(() => {{feature_name.pascalCase()}}Cubit(sl()));
}

void _register{{feature_name.pascalCase()}}(){
final config = FlavorConfig.instance;
switch(config.flavor){
case Flavor.dev:
_registerDev();
break;
case Flavor.prod:
_registerProd();
break;
case Flavor.demo:
_registerDemo();
break;
}
}

void _registerDev() {
final dio = DioClient().instance;
sl.registerFactory<{{feature_name.pascalCase()}}Api>(() => Dio{{feature_name.pascalCase()}}Api(dio));
}

void _registerProd() {
final dio = DioClient().instance;
sl.registerFactory<{{feature_name.pascalCase()}}Api>(() => Dio{{feature_name.pascalCase()}}Api(dio));
}

void _registerDemo() {
sl.registerFactory<{{feature_name.pascalCase()}}Api>(() => Demo{{feature_name.pascalCase()}}Api());
}