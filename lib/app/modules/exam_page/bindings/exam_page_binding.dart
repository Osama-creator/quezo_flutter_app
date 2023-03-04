import 'package:get/get.dart';

import '../controllers/exam_page_controller.dart';

class ExamPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExamPageController>(
      ExamPageController(),
    );
  }
}
