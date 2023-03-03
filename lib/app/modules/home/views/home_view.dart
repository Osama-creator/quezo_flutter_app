import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/config/utils/colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (controller) {
          controller.getData();
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'الأقسام',
                  style: context.textTheme.headline6!
                      .copyWith(color: AppColors.white),
                ),
                centerTitle: true,
              ),
              body: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.05),
                      child: Center(
                        child: ListView.builder(
                          itemCount: controller.categoriesList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => controller.navigate,
                              child: CategoryCard(
                                title: controller.categoriesList[index].name,
                                color: const Color.fromARGB(255, 75, 0, 9),
                              ),
                            );
                          },
                        ),
                      ),
                    ));
        });
  }
}

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
          style: context.textTheme.headline5!.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
