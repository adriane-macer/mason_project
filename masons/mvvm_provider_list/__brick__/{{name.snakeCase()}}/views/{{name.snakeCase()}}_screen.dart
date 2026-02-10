import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/{{name.snakeCase()}}_view_model.dart';
// TODO add import for dependency injection

class {{name.pascalCase()}}Screen extends StatelessWidget {
const {{name.pascalCase()}}Screen({super.key});

@override
Widget build(BuildContext context) {
return ChangeNotifierProvider(
// Use GetIt to locate and provide the ViewModel
create: (_) => sl<{{name.pascalCase()}}ViewModel>()..loadData(),
child: Scaffold(
appBar: AppBar(title: Text('{{name.pascalCase()}} List')),
body: Consumer<{{name.pascalCase()}}ViewModel>(
builder: (context, vm, _) {
if (vm.isLoading) return const Center(child: CircularProgressIndicator());

return ListView.builder(
itemCount: vm.items.length,
itemBuilder: (context, index) => ListTile(
title: Text(vm.items[index].title),
),
);
},
),
),
);
}
}