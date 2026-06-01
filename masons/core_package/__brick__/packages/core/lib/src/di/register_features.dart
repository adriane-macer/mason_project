Future<void> registerFeatures() async {
  registerAuthFeature();

  registerDashboardFeature();

  registerTransactionFeature();

  registerProfileFeature();
}