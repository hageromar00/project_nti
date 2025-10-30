import 'package:flutter/material.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';

class FavoriteCategorySelector extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const FavoriteCategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final categories = const [
    "All",
    "Shoes",
    "Bags",
    "T-Shirt",
    "Clothes",
    "Pants",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == selectedCategory;
          return Padding(
            padding: EdgeInsets.only(right: width * 0.03),
            child: ChoiceChip(
              label: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : ColorManager.darkGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
              selected: isSelected,
              onSelected: (_) => onCategorySelected(category),
              selectedColor: ColorManager.darkGray,
              backgroundColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
