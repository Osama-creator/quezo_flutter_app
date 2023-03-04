import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quezo/app/data/quistion_item.dart';

import '../../../data/exams_item.dart';
import '../../../data/main_categories_model.dart';

class ExamPageController extends GetxController {
  late PageController pageController;
  final args = Get.arguments as List;
  var isLoading = false;
  var quistionList = <Question>[];
  String userChoice = "";

  Future<void> getData() async {
    final exam = args[0] as MainCategories;
    final catId = args[1] as String;
    final examDetails = args[2] as ExamItem;

    try {
      QuerySnapshot quistions = await FirebaseFirestore.instance
          .collection("sections")
          .doc(catId)
          .collection('subjects')
          .doc(exam.id)
          .collection('quezes')
          .doc(examDetails.id)
          .collection('quez1')
          .get();
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
            ]));
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
    userChoice = value;
    update();
  }

  void goToNextPage(int index) {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void goToPrevPage(int index) {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void onInit() {
    pageController = PageController();
    getData();
    super.onInit();
  }
}
