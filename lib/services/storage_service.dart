import 'package:get_storage/get_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  late final GetStorage _box;

  Future<void> init() async {
    await GetStorage.init();
    _box = GetStorage();
  }

  // Generic storage methods
  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  Future<void> clear() async {
    await _box.erase();
  }

  bool hasData(String key) {
    return _box.hasData(key);
  }

  // User session methods
  Future<void> saveUserId(String userId) async {
    await write('userId', userId);
  }

  String? getUserId() {
    return read<String>('userId');
  }

  Future<void> clearSession() async {
    await remove('userId');
  }

  bool get isAuthenticated => hasData('userId');
}
