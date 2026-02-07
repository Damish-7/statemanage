import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/data_model.dart';

class StudentController extends GetxController {
  RxList<StudentModel> studentList = <StudentModel>[].obs;

  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    getAllStudents();
  }

  Future<void> addStudent(StudentModel value) async {
    isLoading.value = true; 
    
    await Future.delayed(const Duration(seconds: 3));

    final studentDB = await Hive.openBox<StudentModel>('student_db');
    final id = await studentDB.add(value);
    value.id = id;
    studentList.add(value);
    
     isLoading.value = false;
  }



  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentList.assignAll(studentDB.values);
  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.delete(id);
    getAllStudents();
  }
}
