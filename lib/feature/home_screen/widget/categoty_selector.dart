import 'package:flutter/material.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';
import '../../../core/utils/size_config.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onPressed,
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
              : const LinearGradient(
            colors: [Colors.white, Colors.white],
          ),
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
                icon,
                color: Colors.black54,
                size: SizeConfig.w(22),
              ),
            ),
            SizedBox(width: SizeConfig.w(8)),
            if (isSelected)
              Text(
                label,
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
  }
}
