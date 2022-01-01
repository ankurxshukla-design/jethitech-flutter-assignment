import 'package:flutter_assignment/data/user_model.dart';

abstract class UserDetailEvent {}

class UserDetailRequest extends UserDetailEvent {
  final User user;

  UserDetailRequest({required this.user});
}
