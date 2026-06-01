abstract class Failure {
  final String message;
  final int? code;

  const Failure({
    required this.message,
    this.code,
  });
}