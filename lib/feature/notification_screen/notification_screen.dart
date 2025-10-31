import 'package:flutter/material.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';

class NotificationScreen extends StatelessWidget {


  final List<NotificationItem> items = const [
    NotificationItem(
      title: 'The Best Title',
      message:
      'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      date: 'April 30, 2014 1:01 PM',
    ),
    NotificationItem(
      title: 'SUMMER OFFER 98% Cashback',
      message:
      'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      date: 'April 30, 2014 1:01 PM',
    ),
    NotificationItem(
      title: 'Special Offer 25% OFF',
      message:
      'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      date: 'April 30, 2014 1:01 PM',
    ),
  ];

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: const Text('Notification'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => Divider(
            height: 28,
            thickness: 0.5,
            color: Colors.grey[300],
          ),
          itemBuilder: (context, index) {
            final it = items[index];
            return NotificationTile(
              item: it,
              primaryBlue: ColorManager.darkGray,
              lightBlue: ColorManager.lightGray,
            );
          },
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String date;

  const NotificationItem({
    required this.title,
    required this.message,
    required this.date,
  });
}

class NotificationTile extends StatelessWidget {
  final NotificationItem item;
  final Color primaryBlue;
  final Color lightBlue;

  const NotificationTile({
    super.key,
    required this.item,
    required this.primaryBlue,
    required this.lightBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.local_offer_outlined, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.message,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.3,
                  color: Colors.grey[600],
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                item.date,
                style: TextStyle(
                  fontSize: 11,
                  color: primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}