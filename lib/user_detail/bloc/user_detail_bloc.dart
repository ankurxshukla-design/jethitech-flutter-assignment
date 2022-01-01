import 'package:flutter_assignment/data/user_repository.dart';
import 'package:flutter_assignment/user_detail/bloc/user_detail_event.dart';
import 'package:flutter_assignment/user_detail/bloc/user_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final _userRepository = UserRepository();

  UserDetailBloc() : super(UserDetailInitialState()) {
    on<UserDetailRequest>(_getUserDetail);
  }

  void _getUserDetail(UserDetailRequest event, Emitter<UserDetailState> emit) {
    emit(UserDetailLoadingState());
    try {
      final userDetail = _userRepository.getUserDetail(user: event.user);
      if (userDetail != null) {
        emit(UserDetailSuccessState(userDetails: userDetail));
      } else {
        emit(UserDetailErrorState(exception: Exception("User not found")));
      }
    } catch (e) {
      emit(UserDetailErrorState(exception: e as Exception));
    }
  }
}
