import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quezo/core/config/utils/colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/logo.png",
              height: context.height * 0.3,
              width: context.width,
            ),
            Text("Quezo",
                style: context.textTheme.headline3!.copyWith(
                  color: AppColors.primary,
                ))
          ],
        ),
      ),
    );
  }
}
