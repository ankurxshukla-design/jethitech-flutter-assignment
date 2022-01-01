import 'package:flutter/material.dart';
import 'package:flutter_assignment/home/bloc/user_list_bloc.dart';
import 'package:flutter_assignment/home/bloc/user_list_state.dart';
import 'package:flutter_assignment/home/user_row_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JethiTech Solutions"),
      ),
      body: BlocBuilder<UserListBloc, UserListState>(builder: (context, state) {
        if (state is UserListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserListSuccessState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return UserRowWidget(user: state.users[index]);
            },
            itemCount: state.users.length,
          );
        } else if (state is UserListErrorState) {
          return Center(
            child: Text(state.exception.toString()),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
