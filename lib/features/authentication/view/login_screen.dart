// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_mobile/core/common_components/alert.dart';
import 'package:news_mobile/core/common_components/loader.dart';
import 'package:news_mobile/core/theme/app_colors.dart';
import 'package:news_mobile/core/utils/sizing.dart';
import 'package:news_mobile/core/utils/validation_mixim.dart';
import 'package:news_mobile/features/authentication/view/components/auth_button.dart';
import 'package:news_mobile/features/authentication/view/components/custom_formfield.dart';
import 'package:news_mobile/features/authentication/view/signup_screen.dart';
import 'package:news_mobile/features/authentication/viewmodel/auth_notifier.dart';
import 'package:news_mobile/features/home/view/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool checkValue = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const YMargin(10),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    const BorderSide(color: AppColors.mercury),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle_rounded),
                    XMargin(8),
                    Text(
                      'Log in with Google',
                      style: TextStyle(color: AppColors.black),
                    ),
                  ],
                ),
              ),
              const YMargin(20),
              const Divider(
                color: Colors.grey,
                height: 1.5,
                thickness: 0,
              ),
              const YMargin(20),
              CustomFormField(
                title: 'Email',
                hintText: 'example@mail.com',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateEmail,
              ),
              const YMargin(20),
              CustomFormField(
                title: 'Password',
                hintText: '•••••••••',
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validatePassword,
              ),
              const YMargin(24),
              Row(
                children: [
                  SizedBox.square(
                    dimension: 18,
                    child: Checkbox(
                      value: checkValue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      activeColor: AppColors.azureRadiance,
                      focusColor: AppColors.mercury,
                      onChanged: (bool? newValue) {
                        setState(() {
                          checkValue = newValue ?? false;
                        });
                      },
                    ),
                  ),
                  const XMargin(8),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const YMargin(12),
              AuthButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus;
                      _login(context);
                    }
                  },
                  label: 'Log in'),
              const YMargin(12),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.azureRadiance,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const YMargin(8),
              const Divider(
                color: Colors.grey,
                height: 1.5,
                thickness: 0,
              ),
              const YMargin(20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Don\'t have an account?\n',
                  style: const TextStyle(
                    height: 1.5,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(color: AppColors.azureRadiance),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    final loader = Loader(context);
    loader.show();
    final container = ProviderContainer();
    final model = container.read(authProvider.notifier);
    await model.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    loader.close();
    if (container.read(authProvider).success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Home()),
      );
    } else {
      Alert.show(context,
          description: container.read(authProvider).errorMessage);
    }
  }
}
