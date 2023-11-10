import 'package:get_storage/get_storage.dart';

class LocalStgService {
  final _storage = GetStorage();

  /// Save data to storage.
  Future<void> saveData(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  /// Get data from storage.
  dynamic getData(String key) {
    return _storage.read(key);
  }

  /// Update data in storage.
  Future<void> updateData(String key, dynamic value) async {
    if (_storage.hasData(key)) {
      await _storage.write(key, value);
    } else {
      await _storage.write(key, value);
    }
  }

  /// Delete data from storage.
  Future<void> deleteData(String key) async {
    await _storage.remove(key);
  }

  /// Clear all data from storage.
  Future<void> clearAllData() async {
    await _storage.erase();
  }
}
