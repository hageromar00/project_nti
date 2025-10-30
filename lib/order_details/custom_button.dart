import 'package:flutter/material.dart';
import 'package:project_nti_app/core/widget/button_1.dart';

class OrderButtons extends StatelessWidget {
  const OrderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Button1(
            iconPath: 'assets/icon2.png',
            text: 'Track Order',
            onTab: () {},
            fontSize: 15,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {},
            child: Row(
              children: [
                const SizedBox(width: 3),
                Image.asset('assets/icon1.png', height: 24, width: 20),
                const SizedBox(width: 8),
                const Text(
                  "Download Receipt",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
