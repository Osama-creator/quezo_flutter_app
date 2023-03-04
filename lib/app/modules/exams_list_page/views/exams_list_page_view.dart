import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/exams_list_page_controller.dart';

class ExamsListPageView extends GetView<ExamsListPageController> {
  const ExamsListPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamsListPageController>(
        init: ExamsListPageController(),
        initState: (_) {},
        builder: (controller) {
          controller.getData();
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: controller.isLoading
                    ? const CircularProgressIndicator()
                    : GridView.builder(
                        itemCount: controller.examsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 1.1),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => controller.navigate(index),
                            child: Card(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    controller.examsList[index].name,
                                    style: context.textTheme.bodyText2,
                                  ),
                                  Text(
                                    " عدد الإسئله :${controller.examsList[index].qNumber}",
                                    style: context.textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          );
        });
  }
}
