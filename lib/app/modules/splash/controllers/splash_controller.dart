import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quezo/app/modules/views/no_internet.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigateToHomePage();
    super.onInit();
  }

  Future<void> navigateToHomePage() async {
    bool hasConnection = await InternetConnectionChecker().hasConnection;
    if (hasConnection) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.to(const NoInternet());
    }
  }
}
