import 'package:flutter/material.dart';
import 'package:news_mobile/core/theme/app_colors.dart';
import 'package:news_mobile/core/utils/sizing.dart';
import 'package:news_mobile/features/authentication/view/signup_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/onboarding_images/image1.jpg',
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const XMargin(10),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/onboarding_images/image2.jpg',
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const XMargin(10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/onboarding_images/image3.jpg',
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              //const YMargin(10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/onboarding_images/image4.jpg',
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const XMargin(10),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/onboarding_images/image5.jpg',
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const XMargin(10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/onboarding_images/image6.jpg',
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const YMargin(10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/onboarding_images/image7.jpg',
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const XMargin(10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/onboarding_images/image8.jpg',
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const YMargin(60),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Get the latest and updated ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'News',
                      style: TextStyle(
                        color: AppColors.dodgerBlue,
                      ),
                    ),
                    TextSpan(text: ' easily with us'),
                  ],
                ),
              ),
              const YMargin(20),
              const Text(
                'Come on, get the latest news and updates every day and add insight, your trusted knowledge with us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignupScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.dodgerBlue),
                  foregroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
