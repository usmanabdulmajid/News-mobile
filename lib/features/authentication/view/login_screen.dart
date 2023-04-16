import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile/core/theme/app_colors.dart';
import 'package:news_mobile/core/utils/sizing.dart';
import 'package:news_mobile/features/authentication/view/components/auth_button.dart';
import 'package:news_mobile/features/authentication/view/components/custom_formfield.dart';
import 'package:news_mobile/features/authentication/view/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            ),
            const YMargin(20),
            CustomFormField(
              title: 'Password',
              hintText: '•••••••••',
              controller: passwordController,
              obscureText: true,
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
            AuthButton(onPressed: () {}, label: 'Log in'),
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
    );
  }
}
