import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:siktok/views/screens/auth/login.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<signup> {
  final key = GlobalKey<FormState>();
  final email = TextEditingController();
  final pass = TextEditingController();
  Future signup(String email, String pass) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        print("$email successfully");
      }).onError((error, stackTrace) {
        print('Already');
      });
    } catch (err) {
      throw Exception(err);
    }
  }

  Future forgotPass(String email) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) {
        print("reset password");
      }).onError((error, stackTrace) {
        print('Email is Not registered');
      });
    } catch (err) {
      throw (Exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Icon(
                Icons.email,
                size: 100,
                color: Color.fromARGB(255, 255, 71, 71),
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 20, right: 20, bottom: 10),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "Enter your Email" : null,
                  controller: email,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: const Color.fromARGB(255, 211, 210, 210),
                    filled: true,
                    hintText: 'Enter your Email Id',
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: TextFormField(
                  validator: (value) =>
                      value!.length == 0 ? "Enter your password" : null,
                  controller: pass,
                  maxLength: 16,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                    fillColor: const Color.fromARGB(255, 211, 210, 210),
                    filled: true,
                    hintText: 'Enter your Password',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3,
                            color: Colors.black,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (key.currentState!.validate()) {
                          forgotPass(email.text.trim());
                        }
                      },
                      child: Text("forgot password")),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              CupertinoButton(
                color: Color.fromARGB(255, 204, 203, 203),
                child:  Text(
                  'Signup',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 30),
                ),
                onPressed: () {
                  if (key.currentState!.validate()) {
                    signup(email.text.trim(), pass.text.trim());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const login()));
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Color.fromARGB(255, 204, 203, 203),
                child:  Text(
                  'Login',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 30),
                ),
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
