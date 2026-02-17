import 'dart:convert';
import 'package:crypto/crypto.dart';

String generateFilterHash(Map<String, dynamic>? filters) {
  if (filters == null || filters.isEmpty) return 'default';
  final jsonString = jsonEncode(filters);
  return sha1.convert(utf8.encode(jsonString)).toString();
}
