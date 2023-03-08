import 'package:get/get.dart';
import 'package:quezo/app/data/main_categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  var categoriesList = <MainCategories>[];

  Future<void> getData() async {
    isLoading = true;
    try {
      QuerySnapshot categories =
          await FirebaseFirestore.instance.collection('sections').get();
      categoriesList.clear();
      for (var category in categories.docs) {
        //? sec here refers to section
        categoriesList.add(MainCategories(
          name: category['name'],
          id: category.id,
          image: category['image'],
          sec: category['sec'],
        ));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  void navigate(int index) {
    Get.toNamed(
      Routes.SUBJECTS_PAGE,
      arguments: categoriesList[index],
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
