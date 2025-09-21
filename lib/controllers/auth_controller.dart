import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final _storage = GetStorage();
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = _storage.read('isLoggedIn') ?? false;
  }

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'test@example.com' && password == '123456') {
      isLoggedIn.value = true;
      _storage.write('isLoggedIn', true);
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    isLoggedIn.value = false;
    _storage.write('isLoggedIn', false);
  }
}
