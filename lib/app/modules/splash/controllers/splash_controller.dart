import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigateToHomePage();
    super.onInit();
  }

  Future<void> navigateToHomePage() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Get.offAllNamed(Routes.HOME);
  }
}
