import 'package:flutter/material.dart';
import 'package:flutter_assignment/home/bloc/user_list_bloc.dart';
import 'package:flutter_assignment/home/bloc/user_list_event.dart';
import 'package:flutter_assignment/home/bloc/user_list_state.dart';
import 'package:flutter_assignment/login/add_user_details_dialog.dart';
import 'package:flutter_assignment/data/user_model.dart';
import 'package:flutter_assignment/user_detail/user_detail_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UserRowWidget extends StatelessWidget {
  final User user;

  const UserRowWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name, style: TextStyle(fontFamily: GoogleFonts.workSans().fontFamily),),
        subtitle: Text(user.accountType),
        onTap: () {
          if (user.signedIn) {
            _gotoUserDetailPage(context);
          } else {
            _showLoginDialog(context);
          }
        },
        trailing: TextButton(
          child: Text(user.signedIn ? "SIGN OUT" : "SIGN IN"),
          onPressed: () {
            if (!user.signedIn) {
              _showLoginDialog(context);
            } else {
              _showSignOutDialog(context);
            }
          },
        ),
      ),
    );
  }

  void _gotoUserDetailPage(BuildContext buildContext) {
    Navigator.of(buildContext).push(MaterialPageRoute(builder: (context) {
      return UserDetailView(user: user);
    }));
  }

  void _showLoginDialog(BuildContext buildContext) {
    showDialog(
      context: buildContext,
      builder: (builder) {
        return AddUserDetailsDialog(user: user);
      },
    );
  }

  void _showSignOutDialog(BuildContext buildContext) {
    showDialog(
      context: buildContext,
      builder: (builder) {
        return AlertDialog(
          title: Text(
            user.name,
            style: TextStyle(
              fontFamily: GoogleFonts.workSans().fontFamily,
            ),
          ),
          content: const Text("Sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(buildContext).maybePop();
              },
              child: const Text("NO"),
            ),
            BlocBuilder<UserListBloc, UserListState>(builder: (context, state) {
              return TextButton(
                onPressed: () {
                  context
                      .read<UserListBloc>()
                      .add(UserLogoutRequest(user: user));
                  Navigator.of(context).maybePop();
                },
                child: const Text("YES"),
              );
            }),
          ],
        );
      },
    );
  }
}
