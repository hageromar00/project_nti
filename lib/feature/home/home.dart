import 'package:flutter/material.dart';
import 'package:project_nti_app/feature/home/widget/custom_bottomNavigationBar.dart';
import 'package:project_nti_app/feature/home_screen/home_screen_product.dart';
import 'package:project_nti_app/feature/profile_screen/profile_screen.dart';

import '../favorite_screen/favorite_screen.dart';
import '../home_screen/widget/custom_home_app_bar.dart';
import '../notification_screen/notification_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> screens = [
    HomeScreenProduct(),
    FavoriteScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: screens[_currentIndex],
    );
  }
}
