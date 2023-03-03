import 'package:get/get.dart';

import '../controllers/exams_list_page_controller.dart';

class ExamsListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExamsListPageController>(
      ExamsListPageController(),
    );
  }
}
