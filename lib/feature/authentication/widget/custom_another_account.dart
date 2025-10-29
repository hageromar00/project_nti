import 'package:flutter/material.dart';
import 'custom_container_image.dart';

class CustomAnotherAccount extends StatelessWidget {
  const CustomAnotherAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CustomContainerImage(image: 'assets/apple.png'),
        SizedBox(width: 15),
        CustomContainerImage(image: 'assets/gmail.png'),
        SizedBox(width: 15),
        CustomContainerImage(image: 'assets/faceboook.png'),
      ],
    );
  }
}
