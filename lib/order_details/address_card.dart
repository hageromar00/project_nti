import 'package:flutter/material.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ الجزء الخاص بالنصوص على اليسار
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: const Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.edit, size: 18),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  "Andria Kate\n2573 Housing Estate, India 31165\n+912568595410\nexample@gmail.com",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),
          Image.asset(
            "assets/images/map.png",
            width: 120, // ✅ هنا التحكم في العرض
            height: 120, // ✅ هنا التحكم في الارتفاع
            fit: BoxFit.contain,
          ),
          // // ✅ الصورة على اليمين
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12),
          //   child: Image.asset(
          //     "assets/images/map.png",
          //     width: 120,   // ✅ هنا التحكم في العرض
          //     height: 120,  // ✅ هنا التحكم في الارتفاع
          //     fit: BoxFit.contain,
          //   ),
          // ),
        ],
      ),
    );
  }
}
