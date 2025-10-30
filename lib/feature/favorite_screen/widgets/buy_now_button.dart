import 'package:flutter/material.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: width * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: ColorManager.primaryColorGradient,
      ),
      child: Center(
        child: Text(
          "Buy Now",
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
