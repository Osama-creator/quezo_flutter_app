import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/utils/colors.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const CategoryCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.height * 0.02),
      height: context.height * 0.1,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: context.textTheme.headline6!
                    .copyWith(color: AppColors.black, fontSize: 22),
              ),
              Text(
                subTitle,
                style: context.textTheme.headline5!
                    .copyWith(color: AppColors.black, fontSize: 15),
              ),
            ],
          ),
          CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
