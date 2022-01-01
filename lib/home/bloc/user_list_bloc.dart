import 'package:flutter_assignment/home/bloc/user_list_event.dart';
import 'package:flutter_assignment/home/bloc/user_list_state.dart';
import 'package:flutter_assignment/data/user_box.dart';
import 'package:flutter_assignment/data/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final _userRepository = UserRepository();

  UserListBloc() : super(UserListInitialState()) {
    on<UserListRequest>(_getUsers);
    on<UserLogoutRequest>(_logoutUser);
    Boxes.getUserDetailsBox().watch().listen((event) {
      add(UserListRequest());
    });
  }

  void _getUsers(UserListRequest event, Emitter<UserListState> emit) async {
    emit(UserListLoadingState());
    try {
      final users = await _userRepository.getUsers();
      emit(UserListSuccessState(users: users));
    } catch (e) {
      emit(UserListErrorState(exception: e as Error));
    }
  }

  void _logoutUser(UserLogoutRequest event, Emitter<UserListState> emit) async {
    emit(UserListLoadingState());
    try {
      await _userRepository.signOut(user: event.user);
      add(UserListRequest());
    } catch (e) {
      emit(UserListErrorState(exception: e as Error));
    }
  }
}
