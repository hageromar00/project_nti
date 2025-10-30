import 'package:flutter/material.dart';
import 'package:project_nti_app/order_details/address_card.dart';
import 'package:project_nti_app/core/widget/custom_appbar.dart';
import 'package:project_nti_app/order_details/custom_button.dart';
import 'package:project_nti_app/order_details/custom_status.dart';
import 'package:project_nti_app/order_details/order_card.dart';
import 'package:project_nti_app/order_details/payment.dart';
import 'package:project_nti_app/order_details/section_tile.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Order"),
            SizedBox(height: 10),
            OrderInfoCard(),

            SizedBox(height: 20),
            SectionTitle(title: "Delivery Address"),
            SizedBox(height: 10),
            DeliveryAddressCard(),

            SizedBox(height: 20),
            SectionTitle(title: "Payment Method"),
            SizedBox(height: 10),
            PaymentMethodCard(),

            SizedBox(height: 20),
            OrderButtons(),

            SizedBox(height: 20),
          
            CurrentStatusCard(),
          ],
        ),
      ),
    );
  }
}
