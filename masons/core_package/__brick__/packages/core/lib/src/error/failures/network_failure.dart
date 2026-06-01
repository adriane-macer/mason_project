import '../failure.dart';

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection',
  });
}