import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/config/config_barrel.dart';

class {{return_class.pascalCase()}}Screen extends StatefulWidget {
  const {{return_class.pascalCase()}}Screen({super.key});

  @override
  State<{{return_class.pascalCase()}}Screen> createState() => _{{return_class.pascalCase()}}ScreenState();
}

class _{{return_class.pascalCase()}}ScreenState extends State<{{return_class.pascalCase()}}Screen> {
  {{name.pascalCase()}}Cubit? _{{name.camelCase()}}Cubit;

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("{{return_class.pascalCase()}}"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: BlocProvider(
              create: (context) => getIt<{{name.pascalCase()}}Cubit>()..initialize(),
              child: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
                builder: (context, state) {
                  return Builder(
                    builder: (context) {
                      _{{name.camelCase()}}Cubit = context.watch<{{name.pascalCase()}}Cubit>();
                      final {{return_class.camelCase()}} = _{{name.camelCase()}}Cubit!.list;
                      return Stack(
                        children: [
                          ListView(
                            controller: _controller,
                            children: [
                              if ({{return_class.camelCase()}}.isNotEmpty)
                                ...{{return_class.camelCase()}}.map((e) => {{return_class.pascalCase()}}Card({{return_class.camelCase()}}Model: e))
                              else
                                const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.newspaper,
                                        size: 100,
                                        color: Colors.grey,
                                      ),

                                      Text("No data found"),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          (_{{name.camelCase()}}Cubit?.loading ?? false)
                              ? Positioned(
                                  bottom: 10,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1.5,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _unregisterFactories();
    _removeScrollListener();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _registerFactories();
    _addScrollListener();
    super.initState();
  }

  void _unregisterFactories() {
    GetItHelper.unregisterFactory<I{
  {name.pascalCase()}
    }Repository>();
    GetItHelper.unregisterFactory< {{name.pascalCase()}}Cubit>();
  }

  void _registerFactories() {
    _registerRepositoryByFlavor();
    GetItHelper.registerFactory< {{name.pascalCase()}}Cubit>(
        {{name.pascalCase()}}Cubit(getIt<I{{name.pascalCase()}}Repository>()),
    );
  }

  void _registerRepositoryByFlavor() {
    final appConfig = getIt<ConfigDependencies>().appConfig;
    switch (appConfig.appFlavor) {
      case AppFlavors.dev:
      case AppFlavors.prod:
        GetItHelper.registerFactory<I
        {
        {name.pascalCase()}
        }Repository>(
    {{name.pascalCase()}}RemoteRepository(),
        );
        break;
      case AppFlavors.demo:
        GetItHelper.registerFactory<I{{name.pascalCase()}}Repository>(
    {{name.pascalCase()}}FakeRepository(),
        );
    }
  }

  void _addScrollListener() {
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.position.pixels;
    if (currentScroll >= maxScroll) {
      if (!(_{{name.camelCase()}}Cubit?.loading ?? false)) {
        _{{name.camelCase()}}Cubit?.loadMore();
      }
    }
  }

  void _removeScrollListener() {
    _controller.removeListener(_onScroll);
  }
}
