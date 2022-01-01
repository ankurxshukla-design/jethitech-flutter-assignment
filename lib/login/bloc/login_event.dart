import 'package:flutter_assignment/data/user_model.dart';

abstract class LoginEvent {}

class UpdateAgeEvent extends LoginEvent {
  final String age;

  UpdateAgeEvent({required this.age});
}

class UpdateGenderEvent extends LoginEvent {
  final String gender;

  UpdateGenderEvent({required this.gender});
}

class LoginSubmitted extends LoginEvent {
  final User user;

  LoginSubmitted({required this.user});
}