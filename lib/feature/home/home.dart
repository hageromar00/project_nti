import 'package:flutter/material.dart';
import 'package:project_nti_app/feature/home/widget/custom_bottomNavigationBar.dart';
import 'package:project_nti_app/feature/home_screen/home_screen_product.dart';
import 'package:project_nti_app/feature/profile_screen/profile_screen.dart';
import '../favorite_screen/favorite_screen.dart';
import '../notification_screen/notification_screen.dart';

class Home extends StatefulWidget {
  final String? name;
  const Home({super.key,this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = [
      HomeScreenProduct(name: widget.name ?? ''),
      FavoriteScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];

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
