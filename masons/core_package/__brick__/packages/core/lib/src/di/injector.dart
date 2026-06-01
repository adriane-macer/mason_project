import 'package:get_it/get_it.dart';

import 'register_core.dart';
import 'register_feature_flags.dart';
import 'register_features.dart';
import 'register_firebase.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  await registerCore();

  await registerFeatureFlags();

  await registerFirebaseModules();

  await registerFeatures();
}