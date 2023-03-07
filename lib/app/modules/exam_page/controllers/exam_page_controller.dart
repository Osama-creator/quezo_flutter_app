import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quezo/app/data/quistion_item.dart';

import '../../../data/exams_item.dart';
import '../../../data/main_categories_model.dart';
import '../../../routes/app_pages.dart';

class ExamPageController extends GetxController {
  late PageController pageController;
  final args = Get.arguments as List;
  var isLoading = false;
  int qNumber = 1;
  var quistionList = <Question>[];

  Future<void> getData() async {
    final exam = args[0] as MainCategories;
    final cat = args[1] as MainCategories;
    final examDetails = args[2] as ExamItem;

    try {
      String collectoinName =
          '${cat.sec}_${exam.sub}_${examDetails.examNumber}';
      QuerySnapshot quistions =
          await FirebaseFirestore.instance.collection(collectoinName).get();
      quistionList.clear();
      for (var quistion in quistions.docs) {
        quistionList.add(Question(
            id: quistion.id,
            rightAnswer: quistion['الإجابة_الصحيحة'],
            question: quistion['السؤال'],
            options: [
              quistion['إجابه_2'],
              quistion['الإجابة_الصحيحة'],
              quistion['إجابه_3'],
              quistion['إجابه_4']
            ]..shuffle()));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    update();
  }

  int qIndex() {
    int n = pageController.hasClients ? pageController.page?.toInt() ?? 0 : 0;
    update();
    return n;
  }

  void selectChoice(String value) {
    final currentQuestion = quistionList[pageController.page!.toInt()];
    currentQuestion.userChoice = value;
    update();
  }

  void goToNextPage(int index) {
    if (qNumber < quistionList.length) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      qNumber++;
    } else {
      Get.toNamed(Routes.EXAM_RESULT, arguments: [quistionList, finalMark()]);
    }

    update();
  }

  void goToPrevPage(int index) {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    qNumber > 1 ? qNumber-- : null;
    update();
  }

  int finalMark() {
    int mark = 0;
    for (int i = 0; i < quistionList.length; i++) {
      if (quistionList[i].userChoice == quistionList[i].rightAnswer) {
        mark++;
      }
    }
    return mark;
  }

  @override
  void onInit() {
    pageController = PageController();
    getData();

    super.onInit();
  }
}
