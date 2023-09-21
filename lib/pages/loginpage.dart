import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Login_UI/pages/createaccount.dart';
import 'package:Login_UI/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  bool _isloading = false;
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final TextEditingController _loginemail = TextEditingController();
  final TextEditingController _loginpassword = TextEditingController();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
        );
      }

      setState(() {
        changeButton = false;
      });
    }
  }

  signInWithEmailAndPassword() async {
    try {
      setState(() {
        _isloading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _loginemail.text,
        password: _loginpassword.text,
      );
      setState(() {
        _isloading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isloading = false;
      });
      if (e.code == 'user-not-found') {
        if (mounted) {
          return Future.delayed(Duration.zero, () async {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.black,
                content: Text(
                  "Incorrect Email!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          });
        }
      } else if (e.code == 'wrong-password') {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                "Incorrect Password!",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.jpg",
                  height: 200,
                ),
                const Text(
                  "Welcome to the App Dev",
                  style: TextStyle(
                    color: Color.fromARGB(255, 101, 101, 101),
                    fontSize: 22,
                  ),
                ),
                const Text(
                  "Login here",
                  style: TextStyle(
                    color: Color.fromARGB(255, 101, 101, 101),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _loginemail,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2)),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 98, 91, 91),
                          ),
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 50),
                      TextFormField(
                          controller: _loginpassword,
                          obscureText: _isObscure,
                          maxLength: 20,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orange, width: 2)),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 98, 91, 91),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 8) {
                              return "Password should be atleast of 8 characters";
                            }
                            return null;
                          }),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signInWithEmailAndPassword();
                          }
                        },
                        child: _isloading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Colors.white,
                              ))
                            : Text("Login"),
                        style: TextButton.styleFrom(
                            fixedSize: const Size(500, 30),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.purple,
                            textStyle: const TextStyle(fontSize: 15)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateAccount()),
                          );
                        },
                        child: const Text(
                          "Create an account",
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
