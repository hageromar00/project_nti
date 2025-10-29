import 'package:flutter/material.dart';

class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.white, // ✅ الخلفية البيضاء
              width: 80,
              height: 80,
              child: Image.asset("assets/images/shoe.png", fit: BoxFit.contain),
            ),
          ),

          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Puma Running Shoe",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text("Color: White\nSize: 40", style: TextStyle(fontSize: 13)),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quantity: 1", style: TextStyle(fontSize: 13)),
                    Text(
                      "Price: \$23.87",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Text("GST: 25%", style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
