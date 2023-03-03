import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/config/utils/colors.dart';
import '../../views/category_card.dart';
import '../controllers/subjects_page_controller.dart';

class SubjectsPageView extends GetView<SubjectsPageController> {
  const SubjectsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectsPageController>(
        init: SubjectsPageController(),
        initState: (_) {},
        builder: (controller) {
          controller.getData();
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'المواد',
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
                          itemCount: controller.subjectsList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => controller.navigate(index),
                              child: CategoryCard(
                                title: controller.subjectsList[index].name,
                                color: const Color.fromARGB(255, 43, 43, 43),
                              ),
                            );
                          },
                        ),
                      ),
                    ));
        });
  }
}
