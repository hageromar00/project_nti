import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/style/style.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChange;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: ColorManager.primaryColorGradient,
        ),
        child: GNav(
          rippleColor: Colors.blueGrey,
          hoverColor: Colors.grey,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.transparent,
          color: Colors.black,
          selectedIndex: currentIndex,
          onTabChange: onTabChange,
          tabs: [
            GButton(
              icon: CupertinoIcons.home,
              iconColor: Colors.white,
              iconActiveColor: Colors.white,
              text: 'Home',
              textStyle: StyleApp.textStyle20,
            ),
            GButton(
              icon: CupertinoIcons.heart,
              iconColor: Colors.white,
              iconActiveColor: Colors.white,
              text: 'Favorite',
              textStyle: StyleApp.textStyle20,
            ),
            GButton(
              icon: CupertinoIcons.bell,
              iconColor: Colors.white,
              iconActiveColor: Colors.white,
              text: 'Updates',
              textStyle: StyleApp.textStyle20,
            ),
            GButton(
              icon: Icons.circle,
              iconColor: Colors.transparent,
              leading: ClipRRect(child: Image.asset('assets/user.png')),
              text: 'Profile',
              textStyle: StyleApp.textStyle20,
            ),
          ],
        ),
      ),
    );
  }
}
