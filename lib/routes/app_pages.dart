import 'package:get/get.dart';
import 'package:tracker/middlewares/auth_middleware.dart';
import 'package:tracker/middlewares/guest_middleware.dart';
import 'package:tracker/pages/add_task_page.dart';
import 'package:tracker/pages/main_page.dart';
import 'package:tracker/pages/onboarding_page.dart';
import 'package:tracker/pages/signin_page.dart';
import 'package:tracker/pages/signup_page.dart';
import 'routes.dart';

class AppPages {
  static const initial = AppRoutes.main;

  static final routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      middlewares: [AuthMiddleware()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => const SigninPage(),
      middlewares: [GuestMiddleware()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupPage(),
      middlewares: [GuestMiddleware()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.addProject,
      page: () => const AddTaskPage(),
      middlewares: [AuthMiddleware()],
      transition: Transition.cupertino,
    ),
  ];
}
