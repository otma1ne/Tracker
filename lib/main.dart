import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tracker/controllers/auth_controller.dart';
import 'package:tracker/routes/routes.dart';
import 'package:tracker/theme/dark_theme.dart';
import 'package:tracker/theme/light_theme.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AuthController());

  final box = GetStorage();
  final seenOnboarding = box.read('seenOnboarding') ?? false;

  runApp(MainApp(seenOnboarding: seenOnboarding));
}

class MainApp extends StatelessWidget {
  final bool seenOnboarding;
  const MainApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tracker App',
      initialRoute: seenOnboarding ? AppRoutes.main : AppRoutes.onboarding,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
    );
  }
}
