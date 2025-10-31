import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/firebase/firebase_db.dart';
import 'core/routes/app_routes.dart';
import 'feature/authentication/cubit/logic.dart';
import 'feature/authentication/login_screen/login_screen.dart';
import 'feature/authentication/signup_screen/signup_screen.dart';
import 'feature/home/home.dart';
import 'feature/home_screen/cubit/product_cubit.dart';
import 'feature/onboarding_screen/onboarding_screen.dart';
import 'feature/profile_screen/profile_screen.dart';
import 'feature/splash_screen/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //await FirebaseDataBase().ProductToFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(FirebaseDataBase()),
        ),
        BlocProvider<ProductCubit>(
          create: (context) =>
              ProductCubit(firebaseDataBase: FirebaseDataBase()),
        ),
        BlocProvider(
          create: (context) => UserCubit(FirebaseDataBase()),
          child: ProfileScreen(),
        )
      ],
      child: MaterialApp(
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.onboarding: (context) => const OnboardingScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.signup: (context) => const SignupScreen(),
          AppRoutes.home: (context) => const Home( ),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
