import 'package:flutter/material.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/utils/size_config.dart';
import 'filter_bottom_sheet.dart';

class CustomSearchFilter extends StatelessWidget {
  const CustomSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(12),
              vertical: SizeConfig.h(8),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.w(30)),
              color: ColorManager.secondaryColor,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: SizeConfig.w(22),
                  color: Colors.grey[700],
                ),
                SizedBox(width: SizeConfig.w(8)),
                Text(
                  'What do you need?',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: SizeConfig.w(14),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              backgroundColor: Colors.white,
                builder: (_) => FilterBottomSheet(),

            );
          },
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(8)),
            margin: EdgeInsets.only(left: SizeConfig.w(6)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.w(30)),
              gradient: ColorManager.primaryColorGradient,
            ),
            child: Image.asset(
              'assets/filter.png',
              width: SizeConfig.w(24),
              height: SizeConfig.h(24),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}


