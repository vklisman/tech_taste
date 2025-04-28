import 'package:flutter/material.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';

class CategoriesWidget extends StatelessWidget {
  final String category;
  const CategoriesWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        spacing: 8.0,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              'assets/categories/${category.toLowerCase()}.png',
              height: 48),
          Text(category, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), ),
        ],
      ),
    );
  }
}
