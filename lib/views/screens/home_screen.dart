import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siktok/models/user.dart';
import 'package:siktok/provider/firebase_provider.dart';
import 'package:siktok/views/screens/user_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
    super.initState();
  }


  final userData = [
    UserModel(
        uid: '1',
        name: 'kalyan',
        email: 'Kalyan@gmail.com',
        image:
            'https://cdn.pixabay.com/photo/2023/10/30/05/19/sunflowers-8351807_640.jpg',
        lastActive: DateTime.now(),
        isOnline: true),
    UserModel(
        uid: '2',
        name: 'pediredla',
        email: 'Kalyanpediredla@gmail.com',
        image:
            'https://cdn.pixabay.com/photo/2023/10/30/05/19/sunflowers-8351807_640.jpg',
        lastActive: DateTime.now(),
        isOnline: true),
    UserModel(
        uid: '1',
        name: 'sai',
        email: 'Kalyan@gmail.com',
        image:
            'https://cdn.pixabay.com/photo/2023/10/30/05/19/sunflowers-8351807_640.jpg',
        lastActive: DateTime.now(),
        isOnline: true),
    UserModel(
        uid: '2',
        name: 'vijay',
        email: 'Kalyanpediredla@gmail.com',
        image:
            'https://cdn.pixabay.com/photo/2023/10/30/05/19/sunflowers-8351807_640.jpg',
        lastActive: DateTime.now(),
        isOnline: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chats'),
      ),
      body: Consumer<FirebaseProvider>(
        builder: (context, value, child) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: value.users.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => 
          UserItem(
            user: value.users[index],
          ),
        );
      }),
    );
  }
}
