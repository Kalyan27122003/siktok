import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:siktok/views/screens/home_screen.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override


  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final key=GlobalKey<FormState>();
  final email=TextEditingController();
  final pass=TextEditingController();

  Future login(String email,String pass) async {
    
    try{
      final FirebaseAuth auth=FirebaseAuth.instance;
      auth.signInWithEmailAndPassword(email: email, password: pass)
          .then((value){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        print("$email login success");
      }).onError((error, stackTrace){
        print("login success");
      });
    }catch(err){
      throw Exception(err);
    }
  }

  Future forgotpass(String email) async{
    final FirebaseAuth auth=FirebaseAuth.instance;
    try{
      await auth.sendPasswordResetEmail(email: email).then((value){
        print("Reset password");
      }).onError((error, stackTrace){
        print("not registered");
      });
    }catch(err){
      throw Exception(err);
    }
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: key,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 90),

              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    labelText: "mail : "
                ),
                controller: email,
                validator: (val)=>val!.isEmpty ? "Enter mail":null,

              ),
              SizedBox(height:20),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    labelText: "pass : "
                ),
                controller: pass,
                validator: (val)=>val!.isEmpty ? "Enter Password":null,
              ),
              SizedBox(height: 2),
              ElevatedButton(onPressed: (){
                if(key.currentState!.validate()){
                  login(email.text.trim(), pass.text.trim());
                  
                }
              }, child: Text("Login")),
              SizedBox(height: 20),
              GestureDetector(onTap: (){
                forgotpass(email.text.trim());
              },
                  child: Text("forgotpass"))
            ],
          ),),
      ),

    );
  }
}