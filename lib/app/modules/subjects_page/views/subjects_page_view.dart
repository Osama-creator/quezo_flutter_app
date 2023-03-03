import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/subjects_page_controller.dart';

class SubjectsPageView extends GetView<SubjectsPageController> {
  const SubjectsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubjectsPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SubjectsPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
