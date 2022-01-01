import 'package:flutter_assignment/data/user_model.dart';

abstract class UserListState {}

class UserListInitialState extends UserListState {}

class UserListLoadingState extends UserListState {}

class UserListSuccessState extends UserListState {
  final List<User> users;

  UserListSuccessState({required this.users});
}

class UserListErrorState extends UserListState {
  final Error exception;

  UserListErrorState({required this.exception});
}
