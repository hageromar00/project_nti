import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';

class CustomStatus extends StatelessWidget {
  const CustomStatus({super.key,required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            color: Colors.white,
            width: 100.w,
            height: 110.h,
            child: Image.network(
                model.image,
                fit: BoxFit.contain,
              ),
          ),
        ),
         SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                model.name,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
               SizedBox(height: 4.h),
              Text(
                "# Tracking ID: H01234567",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  // From
                   CircleAvatar(radius: 10.r, backgroundColor: Colors.black),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 6),
                      height: 2.h,
                      color: Colors.grey[400],
                    ),
                  ),
                   SizedBox(width: 4.w),
                  CircleAvatar(
                    radius: 11.r,
                    backgroundColor: Colors.grey[500],
                    child:  CircleAvatar(
                      radius: 8.r,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "02/03 Delhi India",
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey[700]),
                  ),
                  SizedBox(width: 22.w),
                  Text(
                    "03/04 Kera India",
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
