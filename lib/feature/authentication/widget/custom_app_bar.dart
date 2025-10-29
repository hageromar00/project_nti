import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String image;
  final double heightValue;
  const CustomAppBar({super.key, required this.image,required this.heightValue});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Image.asset(
      image,
      height: height * heightValue,
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
