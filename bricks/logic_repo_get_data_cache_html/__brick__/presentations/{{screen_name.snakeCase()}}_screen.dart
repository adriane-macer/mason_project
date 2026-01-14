import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:{{project_name.snakeCase()}}/app/config/themes/typography/typography.dart';
import 'package:{{project_name.snakeCase()}}/features/web_view/presentations/custom_web_view_screen_2.dart';


class {{screen_name.pascalCase()}}Screen extends StatefulWidget {
  const {{screen_name.pascalCase()}}Screen({super.key});

  @override
  State<{{screen_name.pascalCase()}}Screen> createState() => _{{screen_name.pascalCase()}}ScreenState();
}

class _{{screen_name.pascalCase()}}ScreenState extends State<{{screen_name.pascalCase()}}Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double widgetWidth = size.width > 600 ? 600 : size.width;

    return SizedBox(
      width: widgetWidth,
      child: BlocProvider(
        create: (context) => getIt<Get{{cache_name.pascalCase()}}Cubit>()..initialize(),
        child: BlocBuilder<Get{{cache_name.pascalCase()}}Cubit, Get{{cache_name.pascalCase()}}State>(
          builder: (context, state) {
            if (state is Get{{cache_name.pascalCase()}}Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            final cubit = context.watch<Get{{cache_name.pascalCase()}}Cubit>();
            final contentLink = cubit.data;

            if (contentLink == null) {
              return Scaffold(
                appBar: AppBar(title: const Text("{{screen_name.sentenceCase()}}")),
                body:
                  RefreshIndicator(
                    onRefresh: () async {
                      cubit.fetchData();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: double.infinity),
                          Icon(
                            Icons.file_copy_outlined,
                            size: 100,
                            color: Colors.blueGrey,
                          ),
                          Text(
                            "No Data",
                            style: contentBodyStyle1.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

              );
            }

            if (contentLink.content?.isNotEmpty ?? false)  {
return Scaffold(
appBar: AppBar(title: const Text("{{screenName.sentenceCase()}}")),
body: RefreshIndicator(
onRefresh: cubit.fetchData,
child: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all(8.0),
child: HtmlWidget(
contentLink.content!,
onLoadingBuilder: (_, _, value) => const Center(
child: SizedBox(
height: 36,
width: 36,
child: CustomLoadingIndicator(size: 36),
),
),
),
),
),
),
);
            } else {

return RefreshIndicator(
onRefresh: cubit.fetchData,
child: CustomWebViewScreen2(link: contentLink.link ?? ""),
);
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _unregisterFactories();
    super.dispose();
  }

  @override
  void initState() {
    _registerFactories();
    super.initState();
  }

  void _unregisterFactories() {
    GetItHelper.unregisterFactory<IGet{{cache_name.pascalCase()}}Repository>();
    GetItHelper.unregisterFactory<Get{{cache_name.pascalCase()}}Cubit>();
  }

  void _registerFactories() {
    _registerRepositoryByFlavor();
    GetItHelper.registerFactory<Get{{cache_name.pascalCase()}}Cubit>(
      Get{{cache_name.pascalCase()}}Cubit(getIt<IGet{{cache_name.pascalCase()}}Repository>()),
    );
  }

  void _registerRepositoryByFlavor() {
    final appConfig = getIt<ConfigDependencies>().appConfig;
    switch (appConfig.appFlavor) {
      case AppFlavors.dev:
      case AppFlavors.prod:
        GetItHelper.registerFactory<IGet{{cache_name.pascalCase()}}Repository>(
          Get{{cache_name.pascalCase()}}RemoteRepository(),
        );
        break;
      case AppFlavors.demo:
        GetItHelper.registerFactory<IGet{{cache_name.pascalCase()}}Repository>(
          Get{{cache_name.pascalCase()}}FakeRepository(),
        );
    }
  }
}
