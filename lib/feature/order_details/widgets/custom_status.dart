import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';
import 'custom_row_status.dart';

class CurrentStatusCard extends StatelessWidget {
  const CurrentStatusCard({super.key,required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                "Current Status",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),

          SizedBox(height: 16.h),
          CustomStatus(model: model),
        ],
      ),
    );
  }
}
