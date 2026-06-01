abstract final class AppDuration {
  static const Duration requestTimeout = Duration(milliseconds: 3000);

  static const Duration fast = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 400);
  static const Duration slow = Duration(milliseconds: 600);
}
