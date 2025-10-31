import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';

class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({super.key,required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              color: Colors.white, 
              width: 80.w,
              height: 80.h,
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2.h),
                Text("Color: White\nSize: 40", style: TextStyle(fontSize: 13.sp)),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quantity: 1", style: TextStyle(fontSize: 13.sp)),
                    Text(
                      "Price: \$${product.price.toString()}",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Text("GST: 25%", style: TextStyle(fontSize: 11.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
