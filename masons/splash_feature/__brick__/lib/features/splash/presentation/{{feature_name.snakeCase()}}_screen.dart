import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/{{feature_name}}_cubit.dart';

@RoutePage()
class {{feature_name.pascalCase()}}Screen extends StatefulWidget {
const {{feature_name.pascalCase()}}Screen({super.key});

@override
State<{{feature_name.pascalCase()}}Screen> createState() =>
_{{feature_name.pascalCase()}}ScreenState();
}

class _{{feature_name.pascalCase()}}ScreenState
extends State<{{feature_name.pascalCase()}}Screen> {
late final {{feature_name.pascalCase()}}Cubit cubit;

@override
void initState() {
super.initState();

cubit = context.read<{{feature_name.pascalCase()}}Cubit>();
cubit.checkAuth();
}

@override
Widget build(BuildContext context) {
return BlocListener<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
listener: (context, state) {
if (state is {{feature_name.pascalCase()}}Authenticated) {
context.replaceRoute(const {{home_route}}());
}

if (state is {{feature_name.pascalCase()}}Unauthenticated) {
context.replaceRoute(const {{login_route}}());
}
},
child: const Scaffold(
body: Center(
child: FlutterLogo(size: 120),
),
),
);
}

@override
void dispose() {
cubit.close();
super.dispose();
}
}