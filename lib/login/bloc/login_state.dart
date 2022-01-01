import 'package:flutter_assignment/form_submission_status.dart';

class LoginState {
  final String age;
  final String gender;
  final FormSubmissionStatus formSubmissionStatus;

  LoginState({
    this.age = "",
    this.gender = "",
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? age,
    String? gender,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return LoginState(
      age: age ?? this.age,
      gender: gender ?? this.gender,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
