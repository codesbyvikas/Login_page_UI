import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikas_gdsc/homepage.dart';
import 'package:vikas_gdsc/loginpage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());

    ever(_user, _initialSereen);
  }

  _initialSereen(User? user) {
    if (user == null) {
      print("LoginPage");
      Get.offAll(() => LoginPage());
    } else {
      Get.off(() => HomePage());
    }
  }

  void Register(String email, password, name, phone) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About user",
        "User message",
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Failed",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }
}
