import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/subjects_page/bindings/subjects_page_binding.dart';
import '../modules/subjects_page/views/subjects_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECTS_PAGE,
      page: () => const SubjectsPageView(),
      binding: SubjectsPageBinding(),
    ),
  ];
}
