import 'package:flutter/material.dart';
import 'package:vikas_gdsc/auth_controller.dart';
import 'package:vikas_gdsc/loginpage.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var _name = TextEditingController();
  var _phone = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          "Create an Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          children: <Widget>[
            image(),
            const SizedBox(height: 10),
            name(),
            const SizedBox(height: 10),
            phoneNumber(),
            const SizedBox(height: 20),
            emaiAdd(),
            const SizedBox(height: 20),
            passwordBox(),
            button(),
            HaveAccount()
          ],
        ),
      ),
    );
  }

  Widget image() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/images/gdsc.png",
        ),
        fit: BoxFit.fill,
      )),
    );
  }

  Widget name() {
    return Container(
      child: Form(
        child: TextFormField(
          controller: _name,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.teal,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2)),
            prefixIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 98, 91, 91),
            ),
            labelText: "Full Name",
          ),
          cursorColor: Colors.black12,
          cursorHeight: 20,
        ),
      ),
    );
  }

  Widget phoneNumber() {
    return Container(
      child: Form(
        child: TextField(
          controller: _phone,
          maxLength: 10,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.teal,
              )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2)),
              prefixIcon: Icon(
                Icons.phone,
                color: Color.fromARGB(255, 98, 91, 91),
              ),
              labelText: "Phone no.",
              counterStyle: TextStyle(
                height: double.minPositive,
              ),
              counterText: ""),
          cursorColor: Colors.black12,
          cursorHeight: 20,
        ),
      ),
    );
  }

  Widget emaiAdd() {
    return Container(
      child: Form(
        child: TextField(
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.teal,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2)),
            prefixIcon: Icon(
              Icons.email,
              color: Color.fromARGB(255, 98, 91, 91),
            ),
            labelText: "Email adress",
          ),
          cursorColor: Colors.black12,
          cursorHeight: 20,
        ),
      ),
    );
  }

  Widget passwordBox() {
    return Container(
      child: Form(
        key: _formkey,
        child: TextFormField(
          maxLength: 20,
          controller: _password,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.teal,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2)),
            prefixIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 98, 91, 91),
            ),
            labelText: "create a password",
          ),
          cursorColor: Colors.black12,
          cursorHeight: 20,
        ),
      ),
    );
  }

  Widget button() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.black),
      child: TextButton(
        child: const Text(
          "Submit",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        onPressed: () {
          // if (_formkey.currentState!.validate()) {
          //   DataControllers.instance.registeredUser(
          //       // controller.email.text.trim(), controller.password.text.trim());
          //   )

          AuthController.instance.Register(_email.text.trim(),
              _password.text.trim, _name.text.trim(), _phone.text.trim());
        },
      ),
    );
  }

  Widget HaveAccount() {
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        child: Text("Already have a account?"),
      ),
    );
  }
}
