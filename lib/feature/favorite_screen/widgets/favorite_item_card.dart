import 'package:flutter/material.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';

class FavoriteItemCard extends StatelessWidget {
  final ProductModel product;

  const FavoriteItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: width * 0.04),
      padding: EdgeInsets.all(width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.image,
              width: width * 0.25,
              height: width * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.04,
                    color: ColorManager.darkGray,
                  ),
                ),
                Text(
                  "Size: 40",
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: ColorManager.lightGray,
                  ),
                ),
                Text(
                  "Quantity: 01",
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: ColorManager.lightGray,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.045,
            ),
          ),
        ],
      ),
    );
  }
}
