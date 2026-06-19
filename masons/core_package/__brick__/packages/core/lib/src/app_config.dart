enum AppEnv { demo, dev, prod }

enum AuthType { firebase, rest, mocked }

class AppConfig {
  const AppConfig({
    required this.appName,
    required this.baseUrl,
    required this.env,
    required this.authType,
    required this.enabledFCM,
    required this.propertyId,
    required this.organizationId,
  });

  final String appName;
  final String baseUrl;
  final AppEnv env;
  final AuthType authType;
  final bool enabledFCM;
  final String propertyId;
  final String organizationId;
}
