import 'package:flutter/material.dart';
import 'package:project_nti_app/order_details/order_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    home: OrderDetailsScreen(),
    );
  }
}
