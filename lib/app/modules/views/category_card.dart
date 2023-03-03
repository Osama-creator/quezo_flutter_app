import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/utils/colors.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryCard({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.height * 0.02),
      height: context.height * 0.1,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          title,
          style: context.textTheme.headline5!
              .copyWith(color: AppColors.white, fontSize: 25),
        ),
      ),
    );
  }
}
