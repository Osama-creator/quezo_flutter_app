import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/exams_item.dart';
import '../../../data/main_categories_model.dart';
import '../../../data/quistion_item.dart';

class ExamPageController extends GetxController {
  final ExamDataFetcher dataFetcher;
  final PaginationController paginationController;
  final args = Get.arguments as List;

  var isLoading = false;
  var quistionList = <Question>[];
  String userChoice = "";

  ExamPageController(this.dataFetcher, this.paginationController);

  Future<void> getData() async {
    isLoading = true;
    update();

    try {
      final exam = args[0] as MainCategories;
      final catId = args[1] as String;
      final examDetails = args[2] as ExamItem;
      quistionList =
          await dataFetcher.fetchQuestions(catId, exam.id, examDetails.id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }

    isLoading = false;
    update();
  }

  int qIndex() {
    int n = paginationController.currentPage();
    update();
    return n;
  }

  void selectChoice(String value) {
    final currentQuestion = quistionList[paginationController.currentPage()];
    currentQuestion.userChoice = value;
    userChoice = value;
    update();
  }

  void goToNextPage(int index) {
    paginationController.goToNextPage();
  }

  void goToPrevPage(int index) {
    paginationController.goToPrevPage();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

abstract class PaginationController {
  int currentPage();
  void goToNextPage();
  void goToPrevPage();
}

class PageControllerAdapter implements PaginationController {
  final PageController _pageController;

  PageControllerAdapter(this._pageController);

  @override
  int currentPage() {
    return _pageController.hasClients ? _pageController.page?.toInt() ?? 0 : 0;
  }

  @override
  void goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void goToPrevPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}

abstract class ExamDataFetcher {
  Future<List<Question>> fetchQuestions(
      String categoryId, String examId, String quizId);
}

class FirebaseExamDataFetcher implements ExamDataFetcher {
  final FirebaseFirestore firestore;

  FirebaseExamDataFetcher(this.firestore);

  @override
  Future<List<Question>> fetchQuestions(
      String categoryId, String examId, String quizId) async {
    final questionsCollection = firestore
        .collection("sections")
        .doc(categoryId)
        .collection('subjects')
        .doc(examId)
        .collection('quezes')
        .doc(quizId)
        .collection('quez1');

    final questionsSnapshot = await questionsCollection.get();

    final questions = questionsSnapshot.docs.map((questionSnapshot) {
      final options = [
        questionSnapshot['إجابه_2'],
        questionSnapshot['الإجابة_الصحيحة'],
        questionSnapshot['إجابه_3'],
        questionSnapshot['إجابه_4'],
      ];

      return Question(
        id: questionSnapshot.id,
        rightAnswer: questionSnapshot['الإجابة_الصحيحة'],
        question: questionSnapshot['السؤال'],
        options: options,
      );
    }).toList();

    return questions;
  }
}
