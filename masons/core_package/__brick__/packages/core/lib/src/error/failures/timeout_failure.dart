import '../failure.dart';

class TimeoutFailure extends Failure {
  const TimeoutFailure({
    super.message = 'Timeout failure',
  });
}