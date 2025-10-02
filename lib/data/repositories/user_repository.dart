import 'package:tracker/models/user.dart';
import 'package:tracker/services/storage_service.dart';

class UserRepository {
  final StorageService _storage = StorageService();
  static const String _userKey = 'user';

  Future<void> saveUser(User user) async {
    await _storage.write(_userKey, user.toJson());
    await _storage.saveUserId(user.id);
  }

  User? getCurrentUser() {
    final json = _storage.read<Map<String, dynamic>>(_userKey);
    if (json == null) return null;
    return User.fromJson(json);
  }

  Future<void> clearUser() async {
    await _storage.remove(_userKey);
    await _storage.clearSession();
  }

  bool get isAuthenticated => _storage.isAuthenticated;
}
