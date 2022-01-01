import 'dart:convert';

import 'package:flutter_assignment/data/user_box.dart';
import 'package:flutter_assignment/data/user_details.dart';
import 'package:flutter_assignment/data/user_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class UserRepository {
  Future<List<User>> getUsers() async {
    final String data = await rootBundle.loadString("data/users.json");
    final json = jsonDecode(data);
    return (json["users"] as List)
        .map((userJson) => User.fromJson(userJson))
        .toList();
  }

  Future<void> signIn({
    required User user,
    required String age,
    required String gender,
  }) async {
    await Boxes.getUserDetailsBox().put(
      user.id,
      UserDetails(
        id: user.id,
        name: user.name,
        accountType: user.accountType,
        age: age,
        gender: gender,
      ),
    );
  }

  Future<void> signOut({required User user}) async {
    await Boxes.getUserDetailsBox().delete(user.id);
  }

  UserDetails? getUserDetail({required User user}) {
    final userDetail = Boxes.getUserDetailsBox().get(user.id);
    return userDetail;
  }
}
