import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikas_gdsc/auth_controller.dart';
import 'package:vikas_gdsc/createaccount.dart';
import 'package:vikas_gdsc/firebase_options.dart';
import 'package:vikas_gdsc/homepage.dart';
import 'package:vikas_gdsc/loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  await Firebase.initializeApp(
          // name: "com.example.app",
          options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthController()));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
