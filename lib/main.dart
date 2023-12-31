import 'package:flutter/material.dart';
import 'package:Login_UI/firebaseStuff/auth_page.dart';
import 'package:Login_UI/firebaseStuff/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
