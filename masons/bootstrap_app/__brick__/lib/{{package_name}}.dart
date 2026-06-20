import 'package:amenities/amenities.dart';
import 'package:app/app.dart';
import 'package:app_router/app_router.dart';
import 'package:bootstrap_shared/bootstrap_shared.dart';
import 'package:feature_billing/feature_billing.dart';
import 'package:feature_bookings/feature_bookings.dart';
import 'package:feature_collections/feature_collections.dart';
import 'package:feature_emergency/feature_emergency.dart';
import 'package:feature_issues/feature_issues.dart';
import 'package:feature_maintenance/feature_maintenance.dart';
import 'package:feature_units/feature_units.dart';
import 'package:feature_user/feature_user.dart';
import 'package:feature_visitors/feature_visitors.dart';
import 'package:{{router_package}}/{{router_package}}.dart';
import 'package:flutter/material.dart';
import 'package:authentication/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:design_system/design_system.dart';
import 'package:core_package/core.dart';

/// Bootstraps the application for {{name.titleCase()}}.
Future<void> bootstrap{{name.pascalCase()}}({
  required AppConfigPolicy appConfigPolicy,
  FirebaseOptions? firebaseOptions,
  Map<String, dynamic>? brandTokenJson,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();
  debugPrint('--- Application Bootstrap: {{name.titleCase()}} ---');
  debugPrint('Environment: ${appConfigPolicy.env}');
  debugPrint('Base URL: ${appConfigPolicy.baseUrl}');
  debugPrint('Package Name: ${packageInfo.packageName}');
  debugPrint('Version: ${packageInfo.version}+${packageInfo.buildNumber}');
  debugPrint('-----------------------------');

  if (appConfigPolicy.env.name != AppEnv.demo &&
      (appConfigPolicy.authType == AuthType.firebase ||
          appConfigPolicy.enabledFCM)) {
    assert(
      firebaseOptions != null,
      'Firebase options must be provided in production and development environments with firebase auth or enabled fcm setup.',
    );
  }

  // Initialize Firebase if options are provided
  if (firebaseOptions != null && appConfigPolicy.env != AppEnv.demo) {
    await initializeFirebase(firebaseOptions);
  }

  final appName = packageInfo.appName;
  sl.registerLazySingleton<AppConfig>(
    () => AppConfig(
      appType: appConfigPolicy.appType,
      appName: appName,
      baseUrl: appConfigPolicy.baseUrl,
      env: appConfigPolicy.env,
      authType: appConfigPolicy.authType,
      enabledFCM: appConfigPolicy.enabledFCM,
      propertyId: appConfigPolicy.propertyId,
      organizationId: appConfigPolicy.organizationId,
    ),
  );

  // Initialize Branding from JSON if provided
  BrandTokens brandTokens = BrandTokens.defaultBrand;
  if (brandTokenJson != null) {
    try {
      final model = BrandTokenModel.fromJson(brandTokenJson);
      brandTokens = BrandTokens(
        primaryColor: ThemeFactory.hexToColor(model.primaryColor),
        secondaryColor: ThemeFactory.hexToColor(model.secondaryColor),
        successColor: ThemeFactory.hexToColor(model.successColor),
        warningColor: ThemeFactory.hexToColor(model.warningColor),
        dangerColor: ThemeFactory.hexToColor(model.dangerColor),
      );
    } catch (e) {
      debugPrint("bootstrap{{name.pascalCase()}} : $e");
    }
  }
  sl.registerSingleton<BrandTokens>(brandTokens);

  // Feature Modules
  final featureModules = [
   // insert modules
  ];

  for (final module in featureModules) {
    await module.register(sl);
  }

  // Setup Dependency Injection
  await setupDependencyInjection();

  await AuthenticationModule().register(sl);

  // Register Router
  sl.registerLazySingleton<BaseAppRouter>(
    () => {{router_name.pascalCase()}}(sl<AuthRepository>()),
  );

  runApp(const MainApp());
}
