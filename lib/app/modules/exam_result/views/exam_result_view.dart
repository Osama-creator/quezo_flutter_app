import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/config/utils/colors.dart';
import '../controllers/exam_result_controller.dart';

class ExamResultView extends GetView<ExamResultController> {
  const ExamResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التقييم'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'الدرجه',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Text(
              "  ${controller.result} / ${controller.questions.length}",
              style: const TextStyle(fontSize: 25, color: Colors.black),
            ),
            Divider(
              height: 2,
              indent: context.width * 0.1,
              endIndent: context.width * 0.1,
            ),
            const Text(
              'مراجعه الاسئله',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Divider(
              height: 2,
              indent: context.width * 0.1,
              endIndent: context.width * 0.1,
            ),
            ...controller.questions.map((e) => SizedBox(
                  width: context.width * 0.9,
                  child: Card(
                    color: AppColors.white,
                    elevation: 10,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e.question!,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: AppColors.primary,
                                  ),
                        ),
                      ),
                      Column(
                        children: [
                          ChoiceItem(
                            icon: Icons.check_circle_outline_outlined,
                            color: AppColors.primary,
                            title: e.rightAnswer,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          e.userChoice != e.rightAnswer
                              ? ChoiceItem(
                                  icon: Icons.close,
                                  color: Colors.red[900]!,
                                  title: e.userChoice!,
                                )
                              : Container()
                        ],
                      )
                    ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class ChoiceItem extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  const ChoiceItem(
      {Key? key, required this.title, required this.color, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: context.height * 0.05,
          width: context.width * 0.8,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: AppColors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                ),
                Icon(
                  icon,
                  color: AppColors.white,
                )
              ],
            ),
          ),
        ));
  }
}
