import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/constants.dart';
import 'package:tracker/controllers/auth_controller.dart';
import 'package:tracker/routes/routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final auth = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await auth.login(_emailController.text, _passwordController.text);
      Get.offAllNamed(AppRoutes.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Center(
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: grey5,
                width: 1.5,
              ),
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
        title: const Text('Sign Up'),
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
                'Create Account',
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
                  'Please enter your information and create your account',
                  style: TextStyle(
                    fontSize: 14,
                    color: grey2,
                    height: 1.8,
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding * 2),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your full name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
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
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
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
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: defaultPadding * 2),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: defaultPadding * 2),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      height: 2,
                      color: grey3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      'Or Sign up with',
                      style: TextStyle(
                        fontSize: 14,
                        color: grey2,
                        height: 1.6,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      height: 2,
                      color: grey3,
                    ),
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
                      border: Border.all(
                        color: grey5,
                        width: 1.5,
                      ),
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
                      border: Border.all(
                        color: grey5,
                        width: 1.5,
                      ),
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
                    'Have an Account?',
                    style: TextStyle(
                      fontSize: 14,
                      color: grey2,
                      height: 1.6,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.signin);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
