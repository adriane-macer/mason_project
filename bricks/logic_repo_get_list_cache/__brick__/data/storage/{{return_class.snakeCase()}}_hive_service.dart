import 'package:flutter/foundation.dart';
import 'package:{{project_name.snakeCase()}}/core/services/storages/hive/abstract_hive_service.dart';
import 'package:{{project_name.snakeCase()}}/features/get_employment_status/data/models/employment_status_entity.dart';
import 'package:{{project_name.snakeCase()}}/features/get_employment_status/data/models/employment_status_model.dart';
import 'package:hive/hive.dart';

class {{return_class.pascalCase()}}HiveService
    extends AbstractHiveService<{{return_class.pascalCase()}}Model, {{return_class.pascalCase()}}Entity> {
  static const String _boxName = "{{return_class.camelCase()}}Box";

  static Future<void> deleteBox() async {
    await Hive.deleteBoxFromDisk(_boxName);
  }

  Future<void> updateItem({required {{return_class.pascalCase()}}Model item}) async {
    final box = await getBox();

    final entities = box.values.toList();

    final index = entities.indexWhere((element) => element.id == item.id);

    if (index < 0) {
      debugPrint(
          "{{return_class.pascalCase()}}HiveService.updateItem : no item stored with ${item.id} just add item");
      addItem(item: item.toEntity());
    } else {
      box.putAt(index, item.toEntity());
    }
  }

  Future<{{return_class.pascalCase()}}HiveService> initialize() async {
    Hive.registerAdapter({{return_class.pascalCase()}}EntityAdapter());

    await initializeBox(boxName: _boxName);
    return this;
  }
}
