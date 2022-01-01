import 'package:flutter/material.dart';
import 'package:flutter_assignment/form_submission_status.dart';
import 'package:flutter_assignment/login/bloc/login_bloc.dart';
import 'package:flutter_assignment/login/bloc/login_event.dart';
import 'package:flutter_assignment/login/bloc/login_state.dart';
import 'package:flutter_assignment/data/user_model.dart';
import 'package:flutter_assignment/user_detail/user_detail_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUserDetailsDialog extends StatelessWidget {
  final User user;
  final _key = GlobalKey<FormState>();

  AddUserDetailsDialog({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: AlertDialog(
        title: Text(
          user.name,
          style: TextStyle(
            fontFamily: GoogleFonts.workSans().fontFamily,
          ),
        ),
        content: Form(
          key: _key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ageField(),
              _genderField(),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            child: const Text("CANCEL"),
          ),
          _signInSubmitButton(),
        ],
      ),
    );
  }

  Widget _ageField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: "Age",
          icon: Icon(Icons.cake_rounded),
        ),
        onChanged: (value) {
          context.read<LoginBloc>().add(UpdateAgeEvent(age: value));
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      );
    });
  }

  Widget _genderField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          hintText: "Gender",
          icon: Icon(Icons.male_rounded),
        ),
        items: const [
          DropdownMenuItem(
            child: Text("Male"),
            value: "Male",
          ),
          DropdownMenuItem(
            child: Text("Female"),
            value: "Female",
          ),
          DropdownMenuItem(
            child: Text("Other"),
            value: "Other",
          ),
        ],
        onChanged: (value) {
          context.read<LoginBloc>().add(UpdateGenderEvent(gender: value ?? ""));
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      );
    });
  }

  Widget _signInSubmitButton() {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.formSubmissionStatus is SubmissionSuccess) {
        _gotoUserDetailPage(context);
      }
    }, builder: (context, state) {
      return TextButton(
        onPressed: () {
          if (_key.currentState?.validate() == true) {
            context.read<LoginBloc>().add(LoginSubmitted(user: user));
          }
        },
        child: const Text("SAVE"),
      );
    });
  }

  void _gotoUserDetailPage(BuildContext buildContext) {
    Navigator.of(buildContext)
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return UserDetailView(user: user);
    }));
  }
}
