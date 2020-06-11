import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class LocalResources {
  LocalResources._();

  static Box _box;

  static Future<void> load() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'local_resources.db');
    Hive.init(dbPath);
    _box = await Hive.openBox('local_resources');
  }

  static _setString(String fieldName, String value) {
    if (value?.isNotEmpty != true) {
      _box.delete(fieldName);
    }

    _box.put(fieldName, value);
  }

  // Example usage
  static String get token => _box.get("token") ?? "";
  static set token(String value) => _setString("token", value);

  static String get refreshToken => _box.get("refresh_token") ?? "";
  static set refreshToken(String value) => _setString("refresh_token", value);
}
