import 'package:{{project_name.snakeCase()}}/core/services/storages/hive/abstract_hive_service.dart';
import 'package:hive/hive.dart';

class {{cache_name.pascalCase()}}HiveService
    extends AbstractHiveService<{{return_class.pascalCase()}}Model, {{return_class.pascalCase()}}Entity> {
  static const String _boxName = "{{cache_name.camelCase()}}Box";

  static Future<void> deleteBox() async {
    await Hive.deleteBoxFromDisk(_boxName);
  }



Future<{{return_class.pascalCase()}}Model> {{method_name.camelCase()}}() async {
final list = await getList();
if(list.isEmpty){
throw Exception("No data");
}
return list.first;
}

Future<void> saveData({required {{return_class.pascalCase()}}Model data}) async {
await clear();
await updateList(list: [data]);
}

  Future<{{cache_name.pascalCase()}}HiveService> initialize() async {
    try{
Hive.registerAdapter({{return_class.pascalCase()}}EntityAdapter());
}catch e{
      debugPrint("{{cache_name.pascalCase()}}HiveService.initialize: $e");
}

    await initializeBox(boxName: _boxName);
    return this;
  }
}
