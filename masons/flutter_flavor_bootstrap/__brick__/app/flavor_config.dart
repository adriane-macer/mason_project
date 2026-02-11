enum Flavor {
  dev,
  prod,
  demo,
}

class FlavorConfig {
  final Flavor flavor;
  final String baseUrl;
  final bool enableLogging;

  static late FlavorConfig instance;

  FlavorConfig._({
    required this.flavor,
    required this.baseUrl,
    required this.enableLogging,
  });

  factory FlavorConfig.create({
    required Flavor flavor,
    required String baseUrl,
    required bool enableLogging,
  }) {
    instance = FlavorConfig._(
      flavor: flavor,
      baseUrl: baseUrl,
      enableLogging: enableLogging,
    );
    return instance;
  }

  bool get isDev => flavor == Flavor.dev;
  bool get isProd => flavor == Flavor.prod;
  bool get isDemo => flavor == Flavor.demo;
}
