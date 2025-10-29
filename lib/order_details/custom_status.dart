import 'package:flutter/material.dart';

class CurrentStatusCard extends StatelessWidget {
  const CurrentStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + Name + Menu
          Row(
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
              // Image.asset("assets/images/shoe.png", width: 50, height: 50),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  "Puma Running Shoe\n# Tracking ID: HO123456789",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
          const SizedBox(height: 15),

          // From - To
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("From", style: TextStyle(fontSize: 12)),
              Text("To", style: TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("02/03 Delhi India", style: TextStyle(fontSize: 12)),
              Text("03/04 Kerala India", style: TextStyle(fontSize: 12)),
            ],
          ),

          const SizedBox(height: 15),

          // Progress Line
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 6,
              width: double.infinity,
              color: const Color(0xFFE0E0E0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(width: 150, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
