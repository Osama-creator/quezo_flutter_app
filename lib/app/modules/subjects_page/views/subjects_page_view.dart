import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/config/utils/colors.dart';
import '../../views/subject_card.dart';
import '../controllers/subjects_page_controller.dart';

class SubjectsPageView extends GetView<SubjectsPageController> {
  const SubjectsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectsPageController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'المواد',
                  style: context.textTheme.headline5!
                      .copyWith(color: AppColors.white, fontSize: 20),
                ),
                centerTitle: true,
              ),
              body: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.05, vertical: 10),
                      child: Center(
                        child: controller.subjectsList.isEmpty
                            ? Lottie.asset('assets/no_data.json',
                                height: context.height * 0.5)
                            : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.92,
                                        crossAxisSpacing: context.width * 0.02,
                                        mainAxisSpacing: context.height * 0.01),
                                itemCount: controller.subjectsList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () => controller.navigate(index),
                                      child: SubjectCard(
                                        title:
                                            controller.subjectsList[index].name,
                                        subTitle: "10 امتحانات ",
                                        image: controller
                                            .subjectsList[index].image!,
                                      ));
                                },
                              ),
                      ),
                    ));
        });
  }
}
