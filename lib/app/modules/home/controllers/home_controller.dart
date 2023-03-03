import 'package:get/get.dart';
import 'package:quezo/app/data/main_categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  var isLoading = false;
  var categoriesList = <MainCategories>[];

  Future<void> getData() async {
    // isLoading = true;
    // update();
    try {
      QuerySnapshot categories =
          await FirebaseFirestore.instance.collection('sections').get();
      categoriesList.clear();
      for (var category in categories.docs) {
        categoriesList
            .add(MainCategories(name: category['name'], id: category.id));
      }
      // isLoading = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      // isLoading = false;
    }

    update();
  }

  void navigate(int index) {
    // Get.toNamed(
    //   Routes.LIST_CATEGORY_PRODUCTS,
    //   arguments: categoriesList[index].id,
    // );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
