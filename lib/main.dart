import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_routes.dart';
import 'feature/authentication/cubit/logic.dart';
import 'feature/authentication/login_screen/login_screen.dart';
import 'feature/authentication/service/firebase_services.dart';
import 'feature/authentication/signup_screen/signup_screen.dart';
import 'feature/onboarding_screen/onboarding_screen.dart';
import 'feature/splash_screen/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => UserCubit(FirebaseService())
      , child:  MaterialApp(
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.onboarding: (context) => OnboardingScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.signup: (context) => SignupScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),);
  }
}
