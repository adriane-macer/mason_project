import 'package:core_package/core.dart';

class AppConfigPolicy {
  final String baseUrl;
  final AppEnv env;
  final String? brandTokenFilename;
  final AuthType authType;
  final bool enabledFCM;
  final String propertyId;
  final String organizationId;

  AppConfigPolicy({
    required this.baseUrl,
    required this.env,
    this.brandTokenFilename,
    required this.authType,
    this.enabledFCM = false,
    required this.propertyId,
    required this.organizationId,
  });
}
