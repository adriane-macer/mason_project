import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Bootstrapping monorepo workspace...');

  try {
    // 1. Generate Flavor-Specific Main Files
    // await _generateFlavorMains(context);

    // 2. Link Workspace via Melos
    // final result = await Process.run(
    //   'melos',
    //   ['bootstrap'],
    //   runInShell: true,
    // );
    //
    // if (result.exitCode == 0) {
    //   progress.complete('🚀 Workspace successfully linked via Melos!');
    // } else {
    //   context.logger.warn(
    //     '⚠️ Melos bootstrap failed. Running standard pub get fallback...',
    //   );
      await _runFallback(context, progress);
    // }
  } catch (e) {
    progress.fail('❌ An unexpected error occurred: $e');
  }
}

Future<void> _generateFlavorMains(HookContext context) async {
  final apps = context.vars['apps'] as List;
  final flavors = context.vars['flavors'] as List;

  for (final app in apps) {
    final appName = app['name'];
    final templateFile = File('apps/$appName/lib/main_flavor.dart.template');

    if (!templateFile.existsSync()) continue;

    final templateContent = templateFile.readAsStringSync();

    for (final flavor in flavors) {
      final flavorName = flavor['name'];
      final isDemo = flavor['isDemo'] == true;

      String content = templateContent
          .replaceAll('{{env_name}}', flavorName.toUpperCase());

      // Simple conditional replacement for the template
      if (isDemo) {
        content = content
            .replaceAll('// @isDemo', '')
            .replaceAll('// @isNotDemo', '/*')
            .replaceAll('// @isDemo ? FakeAuthRepository() : FirebaseAuthRepository();', 'FakeAuthRepository();');
      } else {
        content = content
            .replaceAll('// @isDemo', '/*')
            .replaceAll('// @isNotDemo', '')
            .replaceAll('// @isDemo ? FakeAuthRepository() : FirebaseAuthRepository();', 'FirebaseAuthRepository();');
      }

      File('apps/$appName/lib/main_$flavorName.dart').writeAsStringSync(content);
    }
    templateFile.deleteSync();
  }
}

Future<void> _runFallback(HookContext context, Progress progress) async {
  try {
    await Process.run('flutter', ['pub', 'get'], runInShell: true);
    progress.complete('Generation complete (fallback).');
  } catch (_) {
    progress.fail('❌ Fallback failed.');
  }
}
