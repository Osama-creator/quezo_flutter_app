import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/config/utils/colors.dart';
import '../controllers/exam_page_controller.dart';

class ExamPageView extends GetView<ExamPageController> {
  const ExamPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GetBuilder<ExamPageController>(
        init: ExamPageController(),
        builder: (controller) {
          int index = controller.qIndex();
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                    "السؤال ${controller.qNumber} من ${controller.quistionList.length}",
                    style: Theme.of(context).textTheme.bodyText1),
                centerTitle: true,
                elevation: 10,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.8,
                      width: w,
                      child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.pageController,
                          itemCount: controller.quistionList.length,
                          itemBuilder: (context, index) {
                            return QuestionBody(
                              index: index,
                              quistion:
                                  controller.quistionList[index].question!,
                              list: controller.quistionList[index].options!,
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              controller.goToPrevPage(index);
                            },
                            child: const Text("السابق")),
                        ElevatedButton(
                            onPressed: () {
                              controller.goToNextPage(index);
                            },
                            child: const Text("التالي")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class QuestionBody extends StatelessWidget {
  final String quistion;
  final int index;
  final List<String> list;

  const QuestionBody({
    Key? key,
    required this.index,
    required this.quistion,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GetBuilder<ExamPageController>(
        init: ExamPageController(),
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quistion,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ...list.map((option) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: h * 0.07,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: RadioListTile(
                                value: option,
                                groupValue:
                                    controller.quistionList[index].userChoice,
                                activeColor: AppColors.primary,
                                dense: false,
                                onChanged: (value) {
                                  controller.selectChoice(value!);
                                },
                                title: Text(
                                  option,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: AppColors.primary),
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
