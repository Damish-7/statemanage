import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanage/db/functions/db_functions.dart';
//import '../../db/controller/student_controller.dart';
import '../../db/model/data_model.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  final StudentController controller = Get.find<StudentController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(height: 10),

          TextField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Age',
            ),
          ),
          const SizedBox(height: 10),

     
          Obx(() {
            return ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null : addStudent,    
              child: controller.isLoading.value
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Color.fromARGB(255, 57, 105, 219),
                      ),
                    )
                  : const Text('Add Student'),
            );
          }),
        ],
      ),
    );
  }

  void addStudent() {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();

    if (name.isEmpty || age.isEmpty) return;

    controller.addStudent(
      StudentModel(name: name, age: age),
    );

    _nameController.clear();
    _ageController.clear();
  }
}
