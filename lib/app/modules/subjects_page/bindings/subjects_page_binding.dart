import 'package:get/get.dart';

import '../controllers/subjects_page_controller.dart';

class SubjectsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SubjectsPageController>(
      SubjectsPageController(),
    );
  }
}
