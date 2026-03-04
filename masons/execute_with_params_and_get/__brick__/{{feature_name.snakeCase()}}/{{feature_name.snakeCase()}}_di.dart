import '{{feature_name.snakeCase()}}_barrel.dart';

void setUpEditProfileDI(){
  _register{{feature_name.camelCase()}}();
  sl.registerFactory(() => {{feature_name.pascalCase()}}RemoteDataSourceImpl(sl()));
  sl.registerFactory(() => {{feature_name.pascalCase()}}RepositoryImpl(sl()));
  sl.registerFactory(() => {{feature_name.pascalCase()}}UseCase(sl()));
  sl.registerFactory(() => {{feature_name.pascalCase()}}Cubit(sl()));
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

void _registerDev(){
  sl.registerFactory(() => {{feature_name.pascalCase()}}RemoteApi());
}

void _registerProd(){
  sl.registerFactory(() => {{feature_name.pascalCase()}}RemoteApi());
}

void _registerDemo(){
  sl.registerFactory(() => {{feature_name.pascalCase()}}DemoApi());
}

