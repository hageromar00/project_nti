import 'package:flutter/material.dart';

class CustomContainerImage extends StatelessWidget {
  final String image;
  const CustomContainerImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: width * 0.14,
      width: width * 0.14,
      decoration: BoxDecoration(
        color: const Color(0xffECECEC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Image.asset(image, fit: BoxFit.contain),
      ),
    );
  }
}
