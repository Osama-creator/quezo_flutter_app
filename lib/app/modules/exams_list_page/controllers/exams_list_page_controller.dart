import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quezo/app/data/exams_item.dart';
import 'package:quezo/app/data/main_categories_model.dart';

class ExamsListPageController extends GetxController {
  final args = Get.arguments as List;

  var isLoading = false;
  var examsList = <ExamItem>[];

  Future<void> getData() async {
    final exam = args[0] as MainCategories;
    final catId = args[1] as String;
    // isLoading = true;
    // update();
    try {
      QuerySnapshot subjs = await FirebaseFirestore.instance
          .collection("sections")
          .doc(catId)
          .collection('subjects')
          .doc(exam.id)
          .collection('quezes')
          .get();
      examsList.clear();
      for (var subj in subjs.docs) {
        examsList.add(ExamItem(
            name: subj['name'], id: subj.id, qNumber: subj['q_number']));
      }
      // isLoading = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      // isLoading = false;
    }

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
