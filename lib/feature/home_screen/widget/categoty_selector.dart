import 'package:flutter/material.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';
import '../../../core/utils/size_config.dart';

class CategorySelector extends StatefulWidget {
  //final Function(String categoryName) onCategorySelected;
  //const CategorySelector({super.key, required this.onCategorySelected});
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.local_fire_department, 'label': 'Popular'},
    {'icon': Icons.checkroom, 'label': 'Clothes'},
    {'icon': Icons.watch, 'label': 'Watches'},
    {'icon': Icons.backpack, 'label': 'Bags'},
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox(
      height: SizeConfig.h(70),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              //widget.onCategorySelected(category['label']);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.only(right: SizeConfig.w(10)),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(18),
                vertical: SizeConfig.h(10),
              ),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? ColorManager.primaryColorGradient
                    : const LinearGradient(colors: [Colors.white, Colors.white]),
                borderRadius: BorderRadius.circular(SizeConfig.w(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 6,
                    offset: const Offset(1, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(SizeConfig.w(8)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      category['icon'],
                      color: Colors.black54,
                      size: SizeConfig.w(22),
                    ),
                  ),
                  SizedBox(width: SizeConfig.w(8)),
                  if (isSelected)
                    Text(
                      category['label'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.w(14),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
