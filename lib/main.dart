import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'feature/authentication/login_screen/login_screen.dart';
import 'feature/authentication/signup_screen/signup_screen.dart';
import 'feature/onboarding_screen/onboarding_screen.dart';
import 'feature/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.onboarding: (context) => OnboardingScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.signup: (context) => SignupScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
