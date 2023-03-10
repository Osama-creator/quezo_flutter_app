import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/config/utils/colors.dart';
import '../../views/category_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'الأقسام',
                  style: context.textTheme.headline5!
                      .copyWith(color: AppColors.white, fontSize: 20),
                ),
                centerTitle: true,
              ),
              body: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.05,
                          vertical: context.height * 0.2),
                      child: controller.categoriesList.isEmpty
                          ? Lottie.asset('assets/no_data.json',
                              height: context.height * 0.5)
                          : Center(
                              child: ListView.builder(
                                itemCount: controller.categoriesList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => controller.navigate(index),
                                    child: CategoryCard(
                                      title:
                                          controller.categoriesList[index].name,
                                      subTitle: "10 مواد ",
                                      image: controller
                                          .categoriesList[index].image!,
                                    ),
                                  );
                                },
                              ),
                            ),
                    ));
        });
  }
}
