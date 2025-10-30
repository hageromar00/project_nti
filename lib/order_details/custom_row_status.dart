import 'package:flutter/material.dart';

class CustomStatus extends StatelessWidget {
  const CustomStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.white,
                  width: 100,
                  height: 110,
                  child: Image.asset("assets/image2.png", fit: BoxFit.contain),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Puma Running Shoe",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "# Tracking ID: H01234567",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        // From
                        const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.black,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 6),
                            height: 2,
                            color: Colors.grey[400],
                          ),
                        ),
                        const SizedBox(width: 4),
                        CircleAvatar(
                          radius: 11,
                          backgroundColor: Colors.grey[500],
                          child: const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "02/03 Delhi India",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(width: 22),
                        Text(
                          "03/04 Kera India",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[700],
                          ),
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