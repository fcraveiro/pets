import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageConnector {
  StorageConnector._();

  factory StorageConnector() {
    return StorageConnector._();
  }

  factory StorageConnector.start() {
    return StorageConnector._();
  }
  // Languages? _language;

  Future<Map<String, dynamic>?> load(String resource) async {
    final storage = await SharedPreferences.getInstance();
    Map<String, dynamic> decoded = jsonDecode(
      storage.getString(resource) ?? '{}',
    );
    return decoded.isEmpty ? null : decoded;
  }

  Future<void> save(
    String resource, {
    required Map<String, dynamic> data,
  }) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString(resource, jsonEncode(data));
  }

  Future<void> clear(String resource) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString(resource, jsonEncode({}));
  }
}
