import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               Icon(Icons.credit_card, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                "Credit Card",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.edit, size: 18),
            ],
          ),
          SizedBox(height: 5.h),
          const Text(
            "Andria Kate\n5447 5438 3254 ****\nExpiry: 12/28",
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 6.h),
           Row(
            children: [
              Text(
                "Secure checkout powered by",
                style: TextStyle(fontSize: 11.sp, color: Colors.grey),
              ),
              Expanded(
                child: Text(
                  " Reserve Bank of India RBI",
                  style: TextStyle(fontSize: 12.sp, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
