import 'app/bootstrap.dart';
import 'app/flavor_config.dart';

Future<void> main() async {
  await bootstrap(
    flavor: Flavor.demo,
    baseUrl: 'https://demo.api.com',
    enableLogging: true,
  );
}
