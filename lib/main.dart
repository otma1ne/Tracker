import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/controllers/auth_controller.dart';
import 'package:tracker/controllers/project_controller.dart';
import 'package:tracker/routes/routes.dart';
import 'package:tracker/services/storage_service.dart';
import 'package:tracker/theme/dark_theme.dart';
import 'package:tracker/theme/light_theme.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage
  await StorageService().init();

  // Initialize controllers
  Get.put(AuthController());
  Get.put(ProjectController());

  final storage = StorageService();
  final seenOnboarding = storage.read('seenOnboarding') ?? false;

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
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
    );
  }
}
