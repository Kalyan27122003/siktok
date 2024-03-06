class UserModel {
  final String uid;
  final String name;
  final String email;
  final String image;
  final DateTime lastActive;
  final bool isOnline;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.image,
    required this.lastActive,
    this.isOnline = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'],
      name: json['name'],
      image: json['image'],
      email: json['email'],
      isOnline: json['isOnline'] ?? false,
      lastActive: json['lastactive'].toDate());
}
