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
          return Scaffold(
            body: Center(
              child: controller.isLoading
                  ? const CircularProgressIndicator()
                  : GridView.builder(
                      itemCount: controller.examsList.length,
                      padding: const EdgeInsets.all(5),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: 0.90),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  controller.examsList[index].name,
                                  style: context.textTheme.headline5,
                                ),
                                Text(
                                  controller.examsList[index].qNumber
                                      .toString(),
                                  style: context.textTheme.headline6,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          );
        });
  }
}
