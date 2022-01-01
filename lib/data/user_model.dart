import 'package:flutter_assignment/data/user_box.dart';

class User {
  final String id;
  final String name;
  final String accountType;
  final bool signedIn;

  User({
    required this.id,
    required this.name,
    required this.accountType,
    required this.signedIn
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      accountType: json["atype"] ?? "",
      signedIn: Boxes.getUserDetailsBox().get(json["id"]) != null,
    );
  }
}
