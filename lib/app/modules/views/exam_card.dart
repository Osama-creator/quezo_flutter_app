import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/utils/colors.dart';

class ExamCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const ExamCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color.fromARGB(255, 188, 204, 207),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
                imageUrl: image,
                height: context.height * 0.06,
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: context.height * 0.02,
                    child: const CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 2,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Text(
            title,
            style: context.textTheme.headline6!
                .copyWith(color: AppColors.primary, fontSize: 15),
          ),
          Text(
            subTitle,
            style: context.textTheme.headline5!
                .copyWith(color: AppColors.primary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
