import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:statemanage/db/model/data_model.dart';
import 'package:statemanage/screens/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   if(Hive.isAdapterRegistered(StudentModelAdapter().typeId))
   {
    Hive.registerAdapter(StudentModelAdapter());
   }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
     home: ScreenHome(),
    );
  }
}

