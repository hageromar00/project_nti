import 'package:flutter/material.dart';
import 'package:project_nti_app/order_details/custom_row_status.dart';

class CurrentStatusCard extends StatelessWidget {
  const CurrentStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
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
            children: const [
              Text(
                "Current Status",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),

          const SizedBox(height: 16),
        CustomStatus()
        ],
      ),
    );
  }
}
