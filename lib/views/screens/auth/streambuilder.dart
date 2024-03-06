import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:siktok/views/screens/auth/signup.dart';
import 'package:siktok/views/screens/home_screen.dart';

class AuthChange extends StatefulWidget {
  const AuthChange({super.key});

  @override
  State<AuthChange> createState() => _AuthChangeState();
}

class _AuthChangeState extends State<AuthChange> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return signup();
          }
        });
  }
}
