import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.credit_card, size: 20),
              const SizedBox(width: 8),
              const Text("Credit Card", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.edit, size: 18),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "Andria Kate\n5447 5438 3254 ****\nExpiry: 12/28",
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 6),
          const Row(
            children: [
              Icon(Icons.verified, size: 14, color: Colors.blue),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  "Secure checkout powered by Reserve Bank of India RBI",
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
