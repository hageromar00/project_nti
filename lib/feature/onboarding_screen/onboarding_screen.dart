import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_nti_app/core/routes/app_routes.dart';
import 'package:project_nti_app/feature/onboarding_screen/widget/custom_Slider_Image.dart';
import '../../core/widget/button_1.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                height: screenHeight * 0.45,
                child: const CustomSliderImage(),
              ),
          
              SizedBox(height: screenHeight * 0.06),
          
              Column(
                children: [
                  Text(
                    'Find Your',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bodoniModa(
                      fontSize: screenWidth * 0.1,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      height: 1,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Text(
                    'Best Style',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bodoniModa(
                      fontSize: screenWidth * 0.1,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.015),
          
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Text(
                  'Join and discover the best style\naccording to your passion',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: screenWidth * 0.050,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    height: 1.5,
                    letterSpacing: -0.7,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.15,
                  vertical: screenHeight * 0.03,
                ),
                child: Button1(
                  text: 'Get Started',
                  onTab: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  },
                ),
              ),
          
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
