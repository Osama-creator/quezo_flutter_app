import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quezo/core/config/utils/colors.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/no_internet.json',
                height: context.height * 0.5),
            Text("لا يوجد إتصال بالإنترنت",
                style: context.textTheme.bodyText1!.copyWith(
                  color: AppColors.black,
                ))
          ],
        ),
      ),
    );
  }
}
