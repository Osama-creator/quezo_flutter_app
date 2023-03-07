import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quezo/app/data/exams_item.dart';
import 'package:quezo/app/data/main_categories_model.dart';

import '../../../routes/app_pages.dart';

class ExamsListPageController extends GetxController {
  final args = Get.arguments as List;

  var isLoading = false;
  var examsList = <ExamItem>[];

  Future<void> getData() async {
    final exam = args[0] as MainCategories;
    final cat = args[1] as MainCategories;

    try {
      QuerySnapshot subjs = await FirebaseFirestore.instance
          .collection("sections")
          .doc(cat.id)
          .collection('subjects')
          .doc(exam.id)
          .collection('quezes')
          .get();
      examsList.clear();
      for (var subj in subjs.docs) {
        examsList.add(ExamItem(
            name: subj['name'],
            id: subj.id,
            qNumber: subj['q_number'],
            examNumber: subj['id']));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }

    update();
  }

  void navigate(int index) {
    Get.toNamed(
      Routes.EXAM_PAGE,
      arguments: [...args, examsList[index]],
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
