Future<void> registerFeatureFlags() async {
  if (FlavorConfig.isDemo) {
    getIt.registerLazySingleton<FeatureFlagService>(
      () => LocalFeatureFlagService(
        values: {
          FeatureFlag.newDashboard: true,
          FeatureFlag.sendMoneyV2: true,
        },
      ),
    );

    return;
  }

  getIt.registerLazySingleton<FeatureFlagService>(
    () => RemoteConfigFeatureFlagService(
      FirebaseRemoteConfig.instance,
    ),
  );
}
