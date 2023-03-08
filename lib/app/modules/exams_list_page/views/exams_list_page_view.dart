import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/config/utils/colors.dart';
import '../../views/exam_card.dart';
import '../controllers/exams_list_page_controller.dart';

class ExamsListPageView extends GetView<ExamsListPageController> {
  const ExamsListPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamsListPageController>(
        init: controller,
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'الإمتحانات',
                  style: context.textTheme.headline5!
                      .copyWith(color: AppColors.white, fontSize: 20),
                ),
                centerTitle: true,
              ),
              body: Center(
                child: controller.isLoading
                    ? const CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: controller.examsList.isEmpty
                            ? Lottie.asset('assets/no_data.json',
                                height: context.height * 0.5)
                            : GridView.builder(
                                itemCount: controller.examsList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.8,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () => controller.navigate(index),
                                      child: ExamCard(
                                        image: controller.cardImage,
                                        title: controller.examsList[index].name,
                                        subTitle:
                                            controller.examsList[index].name,
                                      ));
                                },
                              ),
                      ),
              ),
            ),
          );
        });
  }
}
