import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            fontSize: 15.sp,
          ),
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(width: 3.w),
                Image.asset('assets/icon1.png', height: 24, width: 20),
                 SizedBox(width: 8.w),
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
