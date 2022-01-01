import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/user_model.dart';
import 'package:flutter_assignment/user_detail/bloc/user_detail_bloc.dart';
import 'package:flutter_assignment/user_detail/bloc/user_detail_event.dart';
import 'package:flutter_assignment/user_detail/bloc/user_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetailView extends StatelessWidget {
  final User user;

  const UserDetailView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailBloc()..add(UserDetailRequest(user: user)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User Details"),
        ),
        body: BlocBuilder<UserDetailBloc, UserDetailState>(
          builder: (context, state) {
            if (state is UserDetailLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserDetailSuccessState) {
              return Column(
                children: [
                  const Center(
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 150,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    state.userDetails.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: GoogleFonts.workSans().fontFamily,
                    ),
                  ),
                  Text(
                    "Age: ${state.userDetails.age} years",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Gender: ${state.userDetails.gender}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Type: ${state.userDetails.accountType}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            } else if (state is UserDetailErrorState) {
              return Center(child: Text(state.exception.toString()));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
