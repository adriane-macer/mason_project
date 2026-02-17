abstract class {{feature_name.pascalCase()}}RemoteDatasource {
Future<List<{{feature_name.pascalCase()}}Model>> fetchList({
required int offset,
required int limit,
Map<String, dynamic>? filters,
});
}
