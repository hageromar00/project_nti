import 'package:flutter/material.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/utils/size_config.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.w(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SizeConfig.w(30)),
            child: Image.asset(
              'assets/user.png',
              width: SizeConfig.w(45),
              height: SizeConfig.h(45),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Spacer(flex: 1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Zara Lindell',
              style: TextStyle(
                color: Colors.grey,
                fontSize: SizeConfig.w(14),
              ),
            ),
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: SizeConfig.w(16),
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(flex: 3),
        Container(
          padding: EdgeInsets.all(SizeConfig.w(8)),
          margin: EdgeInsets.only(right: SizeConfig.w(6)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.w(30)),
            color: ColorManager.secondaryColor,
          ),
          child: Image.asset(
            'assets/bag.png',
            width: SizeConfig.w(22),
            height: SizeConfig.h(22),
          ),
        ),
      ],
    );
  }
}
