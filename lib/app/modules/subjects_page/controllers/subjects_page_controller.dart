import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/main_categories_model.dart';
import '../../../routes/app_pages.dart';

class SubjectsPageController extends GetxController {
  final categoryId = Get.arguments as MainCategories;
  var isLoading = false;
  var subjectsList = <MainCategories>[];

  Future<void> getData() async {
    try {
      QuerySnapshot subjs = await FirebaseFirestore.instance
          .collection("sections")
          .doc(categoryId.id)
          .collection('subjects')
          .get();
      subjectsList.clear();
      for (var category in subjs.docs) {
        subjectsList.add(MainCategories(
            name: category['name'], id: category.id, sub: category['sub']));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }

    update();
  }

  void navigate(int index) {
    Get.toNamed(
      Routes.EXAMS_LIST_PAGE,
      arguments: [subjectsList[index], categoryId],
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
