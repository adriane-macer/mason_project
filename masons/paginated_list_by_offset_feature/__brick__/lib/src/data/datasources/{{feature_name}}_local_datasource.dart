abstract class {{feature_name.pascalCase()}}LocalDatasource {
Future<void> cacheList(
List<{{feature_name.pascalCase()}}Model> items,
);

Future<List<{{feature_name.pascalCase()}}Model>> getCachedList();
}
