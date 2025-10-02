import 'package:get/get.dart';
import 'package:tracker/data/repositories/user_repository.dart';
import 'package:tracker/models/user.dart';

class AuthController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final Rx<User?> currentUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    currentUser.value = _userRepository.getCurrentUser();
  }

  bool get isLoggedIn => _userRepository.isAuthenticated;

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'test@example.com' && password == '123456') {
      final user = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Test User',
        email: email,
        createdAt: DateTime.now(),
      );

      await _userRepository.saveUser(user);
      currentUser.value = user;
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    await _userRepository.clearUser();
    currentUser.value = null;
  }
}
