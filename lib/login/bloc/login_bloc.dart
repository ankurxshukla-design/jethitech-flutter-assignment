import 'package:flutter_assignment/form_submission_status.dart';
import 'package:flutter_assignment/login/bloc/login_event.dart';
import 'package:flutter_assignment/login/bloc/login_state.dart';
import 'package:flutter_assignment/data/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _userRepository = UserRepository();

  LoginBloc() : super(LoginState()) {
    on<UpdateAgeEvent>(_updateAge);
    on<UpdateGenderEvent>(_updateGender);
    on<LoginSubmitted>(_loginSubmitted);
  }

  void _updateAge(UpdateAgeEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(age: event.age));
  }

  void _updateGender(UpdateGenderEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  void _loginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formSubmissionStatus: FormSubmitting()));
    try {
      await _userRepository.signIn(
        user: event.user,
        age: state.age,
        gender: state.gender,
      );
      emit(state.copyWith(formSubmissionStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(
        formSubmissionStatus: SubmissionFailed(exception: e as Exception),
      ));
    }
  }
}
