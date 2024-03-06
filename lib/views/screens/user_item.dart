import 'package:flutter/material.dart';
import 'package:siktok/models/user.dart';

class UserItem extends StatefulWidget {
  const UserItem({super.key, required this.user});

  final UserModel user;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(alignment: Alignment.bottomRight, children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(widget.user.image),
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: widget.user.isOnline ? Colors.green : Colors.grey,
        )
      ]),
      title: Text(
        widget.user.name,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "last Active ",
        //: ${time.format(widget.user.lastActive)}",
        maxLines: 2,
        style: TextStyle(
            color: const Color.fromARGB(255, 88, 88, 88),
            fontSize: 15,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
