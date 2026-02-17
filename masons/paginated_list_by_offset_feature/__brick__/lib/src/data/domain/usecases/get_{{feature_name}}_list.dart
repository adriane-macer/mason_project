class Get{{feature_name.pascalCase()}}List {
final {{feature_name.pascalCase()}}Repository repository;

Get{{feature_name.pascalCase()}}List(this.repository);

Future<Either<Failure, List<{{feature_name.pascalCase()}}>>> call({
required int offset,
required int limit,
Map<String, dynamic>? filters,
}) {
return repository.getList(
offset: offset,
limit: limit,
filters: filters,
);
}
}
