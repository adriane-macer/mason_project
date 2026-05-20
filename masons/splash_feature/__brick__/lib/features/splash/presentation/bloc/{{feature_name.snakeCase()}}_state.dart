part of '{{feature_name}}_cubit.dart';

sealed class {{feature_name.pascalCase()}}State {}

class {{feature_name.pascalCase()}}Initial extends {{feature_name.pascalCase()}}State {}

class {{feature_name.pascalCase()}}Authenticated extends {{feature_name.pascalCase()}}State {}

class {{feature_name.pascalCase()}}Unauthenticated extends {{feature_name.pascalCase()}}State {}