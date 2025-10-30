import 'package:flutter/material.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../core/utils/size_config.dart';
class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedCategory = 'All';
  double priceValue = 50;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: EdgeInsets.all(SizeConfig.w(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: SizeConfig.w(50),
              height: SizeConfig.h(5),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.h(16)),

          Text(
            'Filter Options',
            style: TextStyle(
              fontSize: SizeConfig.w(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: SizeConfig.h(16)),

          // Category Filter
          Text(
            'Category',
            style: TextStyle(
              fontSize: SizeConfig.w(14),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: SizeConfig.h(8)),
          Wrap(
            spacing: SizeConfig.w(8),
            children: [
              for (var category in ['All', 'Clothes', 'Watches', 'Bags'])
                ChoiceChip(
                  label: Text(category),
                  selected: selectedCategory == category,
                  selectedColor: ColorManager.primaryColorGradient.colors.first,
                  onSelected: (_) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),
            ],
          ),

          SizedBox(height: SizeConfig.h(20)),

          // Price Filter
          Text(
            'Max Price: \$${priceValue.round()}',
            style: TextStyle(
              fontSize: SizeConfig.w(14),
              fontWeight: FontWeight.w600,
            ),
          ),
          Slider(
            activeColor: ColorManager.primaryColorGradient.colors.first,
            value: priceValue,
            min: 0,
            max: 200,
            onChanged: (v) {
              setState(() {
                priceValue = v;
              });
            },
          ),

          SizedBox(height: SizeConfig.h(16)),

          // Apply Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primaryColorGradient.colors.first,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: SizeConfig.h(10)),
                child: Text(
                  'Apply Filters',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.w(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
