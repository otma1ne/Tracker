import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/constants.dart';
import 'package:tracker/controllers/auth_controller.dart';
import 'package:tracker/routes/routes.dart';
import 'package:tracker/widgets/loading_overlay.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final auth = Get.find<AuthController>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final success = await auth.login(
        _emailController.text,
        _passwordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (success) {
        Get.offAllNamed(AppRoutes.main);
      } else {
        Get.snackbar(
          'Login Failed',
          'Invalid email or password',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Center(
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: grey5, width: 1.5),
              borderRadius: BorderRadius.circular(99),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 14,
                color: secondaryColor,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              const Padding(
                padding: EdgeInsetsDirectional.only(end: 80),
                child: Text(
                  'Please enter your email address and password to login',
                  style: TextStyle(
                    fontSize: 14,
                    color: grey2,
                    height: 1.8,
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding * 2),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email required';
                  if (!GetUtils.isEmail(value)) return 'Enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: defaultPadding * 2),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password required';
                  if (value.length < 6) return 'Password too short';
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(height: defaultPadding * 2),
              const Row(
                children: [
                  Expanded(
                    child: Divider(height: 2, color: grey3),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      'Or Sign in with',
                      style: TextStyle(fontSize: 14, color: grey2, height: 1.6),
                    ),
                  ),
                  Expanded(
                    child: Divider(height: 2, color: grey3),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: grey5, width: 1.5),
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/google.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: grey5, width: 1.5),
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/apple.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not registered yet?',
                    style: TextStyle(fontSize: 14, color: grey2, height: 1.6),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.signup),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
        ),
        if (_isLoading)
          const LoadingOverlay(
            message: 'Signing in...',
          ),
      ],
    );
  }
}
