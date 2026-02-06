import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanage/db/functions/db_functions.dart';
//import '../db/controller/student_controller.dart';
import 'widgets/add_student_widget.dart';
import 'widgets/list_student_widget.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final StudentController controller =
      Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Manager')),
      body: Column(
        children: [
          AddStudentWidget(),
          Expanded(child: ListStudentWidget()),
        ],
      ),
    );
  }
}
