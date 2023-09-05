import 'package:flutter/material.dart';
import 'package:vikas_gdsc/createaccount.dart';
import 'package:vikas_gdsc/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
      );

      setState(() {
        changeButton = false;
      });
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
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/gdsc_logo.png",
                  fit: BoxFit.cover,
                ),
                const Text("Welcome  to the App Dev",
                    style: TextStyle(
                      color: Color.fromARGB(255, 130, 121, 121),
                      fontSize: 22,
                    )),
                const Text("Login here",
                    style: TextStyle(
                      color: Color.fromARGB(255, 130, 121, 121),
                      fontSize: 22,
                    )),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
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
                          obscureText: _isObscure,
                          maxLength: 20,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.teal,
                            )),
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
                        child: Text("Login"),
                        style: TextButton.styleFrom(
                            fixedSize: const Size(500, 30),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.purple,
                            textStyle: const TextStyle(fontSize: 15)),
                        onPressed: () => moveToHome(context),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateAccount()),
                          );
                        },
                        child: Text(
                          "create a account",
                          style: TextStyle(
                              color: Colors.black,
                              backgroundColor:
                                  Color.fromARGB(255, 235, 224, 224)),
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
