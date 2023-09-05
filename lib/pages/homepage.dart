import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Welcome ")),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red, // Change the button color as per your style
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Logout',
                style: TextStyle(
                  color:
                      Colors.white, // Change the text color as per your style
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
