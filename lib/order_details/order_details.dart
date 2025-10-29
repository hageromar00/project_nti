import 'package:flutter/material.dart';
import 'package:project_nti_app/order_details/address_card.dart';
import 'package:project_nti_app/order_details/custom_appbar.dart';
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
            // ---------- Order ----------
            SectionTitle(title: "Order"),
            SizedBox(height: 10),
            OrderInfoCard(),

            // ---------- Delivery ----------
            SizedBox(height: 20),
            SectionTitle(title: "Delivery Address"),
            SizedBox(height: 10),
            DeliveryAddressCard(),

            // ---------- Payment ----------
            SizedBox(height: 20),
            SectionTitle(title: "Payment Method"),
            SizedBox(height: 10),
            PaymentMethodCard(),

            // ---------- Buttons ----------
            SizedBox(height: 20),
            OrderButtons(),

            // ---------- Status ----------
            SizedBox(height: 20),
            SectionTitle(title: "Current Status"),
            SizedBox(height: 10),
            CurrentStatusCard(),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class OrderDetailsScreen extends StatelessWidget {
//   const OrderDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F7),
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//               size: 20,
//             ),
//             onPressed: () {},
//           ),
//           centerTitle: true,
//           title: const Text(
//             'Order Details',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//             ),
//           ),
//           actions: const [
//             Padding(
//               padding: EdgeInsets.only(right: 12),
//               child: Icon(
//                 Icons.notifications_none_outlined,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),

//       // ✅ Body
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ---------- Order ----------
//             const Text(
//               "Order",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             _orderInfoCard(),

//             // ---------- Delivery Address ----------
//             const SizedBox(height: 20),
//             const Text(
//               "Delivery Address",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             _deliveryAddressCard(),

//             // ---------- Payment ----------
//             const SizedBox(height: 20),
//             const Text(
//               "Payment Method",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             _paymentMethodCard(),

//             // ---------- Buttons ----------
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     onPressed: () {},
//                     child: const Text("Track Order"),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       side: const BorderSide(color: Colors.black),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       "Download Receipt",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // ---------- Current Status ----------
//             const SizedBox(height: 20),
//             const Text(
//               "Current Status",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             _currentStatusCard(),
//           ],
//         ),
//       ),
//     );
//   }

//   // ✅ 1) Order Card
//   Widget _orderInfoCard() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       padding: const EdgeInsets.all(12),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               "assets/images/shoe.png",
//               width: 70,
//               height: 70,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Puma Running Shoe",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 2),
//                 const Text(
//                   "Color: White\nSize: 40",
//                   style: TextStyle(fontSize: 13),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text("Quantity: 1", style: TextStyle(fontSize: 13)),
//                     Text(
//                       "Price: \$23.87",
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ],
//                 ),
//                 const Text("GST: 25%", style: TextStyle(fontSize: 11)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ 2) Delivery Address Card
//   Widget _deliveryAddressCard() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Text(
//                 "Address",
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(width: 8),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                 child: const Text(
//                   "Home",
//                   style: TextStyle(color: Colors.white, fontSize: 11),
//                 ),
//               ),
//               const Spacer(),
//               const Icon(Icons.edit, size: 18),
//             ],
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             "Andria Kate\n2573 Housing Estate, India 31165\n+912568595410\nexample@gmail.com",
//             style: TextStyle(fontSize: 13),
//           ),
//           const SizedBox(height: 8),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               "assets/images/map.png",
//                         height: 120,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ 3) Payment Method Card
//   Widget _paymentMethodCard() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Icon(Icons.credit_card, size: 20),
//               const SizedBox(width: 8),
//               const Text(
//                 "Credit Card",
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//               ),
//               const Spacer(),
//               const Icon(Icons.edit, size: 18),
//             ],
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             "Andria Kate\n5447 5438 3254 ****\nExpiry: 12/28",
//             style: TextStyle(fontSize: 13),
//           ),
//           const SizedBox(height: 6),
//           Row(
//             children: const [
//               Icon(Icons.verified, size: 14, color: Colors.blue),
//               SizedBox(width: 4),
//               Text(
//                 "Secure checkout powered by Reserve Bank of India RBI",
//                 style: TextStyle(fontSize: 11, color: Colors.blue),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ 4) Current Status (Timeline)
//   Widget _currentStatusCard() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Top Row (Image + Name + Menu Button)
//           Row(
//             children: [
//               Image.asset("assets/images/shoe.png", width: 50, height: 50),
//               const SizedBox(width: 10),
//               const Expanded(
//                 child: Text(
//                   "Puma Running Shoe\n# Tracking ID: HO123456789",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//               const Icon(Icons.more_vert),
//             ],
//           ),
//           const SizedBox(height: 15),

//           // Timeline From -> To
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text("From", style: TextStyle(fontSize: 12)),
//               Text("To", style: TextStyle(fontSize: 12)),
//             ],
//           ),
//           const SizedBox(height: 4),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text("02/03 Delhi India", style: TextStyle(fontSize: 12)),
//               Text("03/04 Kerala India", style: TextStyle(fontSize: 12)),
//             ],
//           ),

//           // Progress Line
//           const SizedBox(height: 15),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(30),
//             child: Container(
//               height: 6,
//               width: double.infinity,
//               color: const Color(0xFFE0E0E0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(width: 150, color: Colors.black),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
