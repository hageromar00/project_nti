import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                     Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(width: 8.w),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontSize: 11.sp),
                      ),
                    ),
                    const Spacer(),
                   Icon(Icons.edit, size: 18.sp),
                  ],
                ),
                 SizedBox(height: 5.h),
                 Text(
                  "Andria Kate\n2573 Housing Estate, India 31165\n+912568595410\nexample@gmail.com",
                  style: TextStyle(fontSize: 13.sp),
                ),
              ],
            ),
          ),

          SizedBox(width: 20.w),
          Flexible(
            child: Image.network(
              "https://developers.google.com/static/maps/solutions/images/store-locator/autocomplete.png?hl=ar",
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
