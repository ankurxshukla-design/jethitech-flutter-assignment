import 'package:flutter_assignment/data/user_model.dart';

abstract class UserListEvent {}

class UserListRequest extends UserListEvent {}

class UserLogoutRequest extends UserListEvent {
  final User user;

  UserLogoutRequest({required this.user});
}
