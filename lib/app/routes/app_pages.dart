import 'package:get/get.dart';

import '../modules/exam_page/bindings/exam_page_binding.dart';
import '../modules/exam_page/views/exam_page_view.dart';
import '../modules/exams_list_page/bindings/exams_list_page_binding.dart';
import '../modules/exams_list_page/views/exams_list_page_view.dart';
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
    GetPage(
      name: _Paths.EXAMS_LIST_PAGE,
      page: () => const ExamsListPageView(),
      binding: ExamsListPageBinding(),
    ),
    GetPage(
      name: _Paths.EXAM_PAGE,
      page: () => ExamPageView(),
      binding: ExamPageBinding(),
    ),
  ];
}
