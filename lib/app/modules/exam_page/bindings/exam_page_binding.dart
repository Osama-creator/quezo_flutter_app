import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/exam_page_controller.dart';

class ExamPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExamDataFetcher>(
        FirebaseExamDataFetcher(FirebaseFirestore.instance));
    Get.put<PaginationController>(PageControllerAdapter(PageController()));
    Get.put<ExamPageController>(
      ExamPageController(
        Get.find<ExamDataFetcher>(),
        Get.find<PaginationController>(),
      ),
    );
  }
}
