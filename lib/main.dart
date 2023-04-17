import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_mobile/core/model/news.dart';
import 'package:news_mobile/core/model/settings.dart';
import 'package:news_mobile/core/utils/logger.dart';
import 'package:news_mobile/features/authentication/view/login_screen.dart';
import 'package:news_mobile/features/home/view/dashboard.dart';
import 'package:news_mobile/features/home/view/home.dart';
import 'package:news_mobile/features/onboarding/settings_notifier.dart';
import 'package:news_mobile/features/onboarding/view/onboarding.dart';
import 'package:news_mobile/features/home/view/news_detail.dart';
import 'package:news_mobile/injection_container.dart';

import 'features/authentication/view/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setup();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, Settings>(
  (ref) => SettingsNotifier(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _cacheassetImage(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Consumer(
        builder: (context, ref, child) {
          final value = ref.read(settingsProvider);
          return value.firstLaunch
              ? const Onboarding()
              : value.hasUserData
                  ? const Home()
                  : const LoginScreen();
        },
      ),
    );
  }

  void _cacheassetImage(BuildContext context) {
    precacheImage(
        const AssetImage('assets/onboarding_images/image1.jpg'), context);
    precacheImage(
        const AssetImage('assets/onboarding_images/image2.jpg'), context);
    precacheImage(
        const AssetImage('assets/onboarding_images/image3.jpg'), context);
    precacheImage(
        const AssetImage('assets/onboarding_images/image4.jpg'), context);
    precacheImage(
        const AssetImage('assets/onboarding_images/image5.jpg'), context);
    precacheImage(
        const AssetImage('assets/onboarding_images/image6.jpg'), context);
    precacheImage(
        const AssetImage('assets/onboarding_images/image7.jpg'), context);
    precacheImage(
        const AssetImage('assets/onboarding_images/image8.jpg'), context);
  }
}
