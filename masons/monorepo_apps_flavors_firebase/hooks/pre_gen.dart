import 'package:interact/interact.dart';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  return;
  try {
    context.logger.info('🚀 Welcome to the Monorepo Workspace Generator');

    // 1. App Selection
    final availableApps = [
      ('customer_app',true),
      ('admin_app',false),
      ('unit_owner_app',true),
      ('tenant_app',true),
      ('security_app',true),
      ('maintenance_app',true),
      ('multiuser_app',false),
    ];

    final appSelections = MultiSelect(
      prompt: 'Which application shells do you want to scaffold?',
      options: availableApps.map((element)=>element.$1).toList(),
      defaults: availableApps.map((element)=>element.$2).toList(),
    ).interact();

    // Map selected indices to objects for Mason looping
    final chosenApps = appSelections.map((index) => {
      'name': availableApps[index].$1,
    }).toList();

    if (chosenApps.isEmpty) {
      context.logger.err('❌ You must select at least one application shell.');
      throw Exception('No apps selected');
    }

    // 2. Flavor Selection
    final availableFlavors = [
      ('demo',true), ('dev',true), ('staging',false), ('prod',true)];
    final flavorSelections = MultiSelect(
      prompt: 'Select the environments/flavors to generate configurations for:',
      options: availableFlavors.map((element)=>element.$1).toList(),
      defaults: availableFlavors.map((element)=>element.$2).toList(),
    ).interact();

    // Map selected indices to objects for Mason looping
    final chosenFlavors = flavorSelections.map((index) {
      final name = availableFlavors[index].$1;
      return {
        'name': name,
        'isDemo': name == 'demo',
      };
    }).toList();

    if (chosenFlavors.isEmpty) {
      context.logger.err('❌ You must select at least one flavor.');
      throw Exception('No flavors selected');
    }

    // 3. Process Flags Matrix
    final flavorsList = chosenFlavors.map((f) => f['name']).toList();
    final hasDemoFlavor = flavorsList.contains('demo');
    final hasRealFlavors = flavorsList.any((f) => f != 'demo');

    // 4. Expose parameters to Mason Template Engine
    context.vars = {
      ...context.vars,
      'apps': chosenApps,               // Structured list: [{'name': 'customer_app'}, ...]
      'flavors': chosenFlavors,         // Structured list: [{'name': 'dev'}, ...]
      'hasDemoFlavor': hasDemoFlavor,   // If true, generates fake_auth_impl
      'hasRealFlavors': hasRealFlavors, // If true, generates firebase_auth_impl
    };

    context.logger.success('⚙️ Configuration resolved! Writing templates...');
  } catch (e) {
    context.logger.err('❌ Hook execution failed: $e');
    // Re-throw if it's not a custom controlled exception to stop Mason
    if (e is! Exception) rethrow;
  }
}
