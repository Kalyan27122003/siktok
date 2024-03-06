import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:siktok/provider/firebase_provider.dart';
import 'package:siktok/views/screens/auth/streambuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => FirebaseProvider(),
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "TikTok",
            home: AuthChange()),
      );
}
