import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile/core/theme/app_colors.dart';
import 'package:news_mobile/core/utils/sizing.dart';
import 'package:news_mobile/features/authentication/view/components/auth_button.dart';
import 'package:news_mobile/features/authentication/view/components/custom_formfield.dart';
import 'package:news_mobile/features/authentication/view/components/password_strength.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool agree = false;
  int strength = 0;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Password listener that changes password strength based on some conditions
    passwordController.addListener(() {
      int s = 0;
      String text = passwordController.text;

      if (text.isNotEmpty) {
        if (text.contains(RegExp(r'[A-Z]')) &&
            text.contains(RegExp(r'[a-z]'))) {
          s += 1;
        }
        if (text.contains(RegExp(r'\d')) && text.contains(RegExp(r'[a-z]'))) {
          s += 1;
        }
        if (text.contains(RegExp(r'\W')) && text.contains(RegExp(r'[a-z]'))) {
          s += 1;
        }
        if (text.length >= 8) s += 1;

        // Update the password strength
        if (s > 0 || strength > 0 && s != strength) {
          setState(() => strength = s);
        }
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
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
              'Sign up',
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
                    'Sign up with Google',
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
              title: 'Name',
              hintText: 'Enter your full name',
              controller: nameController,
            ),
            const YMargin(16),
            CustomFormField(
              title: 'Email',
              hintText: 'example@mail.com',
              controller: emailController,
            ),
            const YMargin(16),
            CustomFormField(
              title: 'Password',
              hintText: 'at least 8 character',
              controller: passwordController,
              obscureText: true,
            ),
            const YMargin(10),
            PasswordStrength(strength: strength),
            const YMargin(20),
            Row(
              children: [
                SizedBox.square(
                  dimension: 18,
                  child: Checkbox(
                    value: agree,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    activeColor: AppColors.azureRadiance,
                    focusColor: AppColors.mercury,
                    onChanged: (bool? newValue) {
                      setState(() {
                        agree = newValue ?? false;
                      });
                    },
                  ),
                ),
                const XMargin(8),
                RichText(
                  text: const TextSpan(
                    text: 'I agree with ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms ',
                        style: TextStyle(color: AppColors.azureRadiance),
                      ),
                      TextSpan(text: 'and'),
                      TextSpan(
                        text: ' Privacy',
                        style: TextStyle(color: AppColors.azureRadiance),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const YMargin(20),
            AuthButton(onPressed: () {}, label: 'Sign up'),
            const YMargin(20),
            const Divider(
              color: Colors.grey,
              height: 1.5,
              thickness: 0,
            ),
            const YMargin(16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have an account?\n',
                style: const TextStyle(
                  height: 1.5,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: 'Log in',
                    style: const TextStyle(color: AppColors.azureRadiance),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
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
