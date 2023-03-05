import 'package:get/get.dart';
import 'package:quezo/app/data/quistion_item.dart';

class ExamResultController extends GetxController {
  final args = Get.arguments as List;
  late List<Question> questions;
  late int result;
  @override
  void onInit() {
    questions = args[0];
    result = args[1];
    super.onInit();
  }
}
