import 'package:flutter_assignment/data/user_details.dart';

abstract class UserDetailState {}

class UserDetailInitialState extends UserDetailState {}

class UserDetailLoadingState extends UserDetailState {}

class UserDetailSuccessState extends UserDetailState {
  final UserDetails userDetails;

  UserDetailSuccessState({required this.userDetails});
}

class UserDetailErrorState extends UserDetailState {
  final Exception exception;

  UserDetailErrorState({required this.exception});
}
