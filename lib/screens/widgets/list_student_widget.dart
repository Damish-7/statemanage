import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanage/db/functions/db_functions.dart';
//import '../../db/controller/student_controller.dart';

class ListStudentWidget extends StatelessWidget {
  ListStudentWidget({super.key});

  final StudentController controller = Get.find<StudentController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.studentList.isEmpty) {
        return const Center(child: Text('No students found'));
      }

      return ListView.builder(
        itemCount: controller.studentList.length,
        itemBuilder: (context, index) {
          final student = controller.studentList[index];
          return Card(
            child: ListTile(
              title: Text(student.name),
              subtitle: Text(student.age),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  controller.deleteStudent(student.id!);
                },
              ),
            ),
          );
        },
      );
    });
  }
}
