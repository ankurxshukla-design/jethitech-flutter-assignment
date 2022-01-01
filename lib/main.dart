import 'package:flutter/material.dart';
import 'package:flutter_assignment/home/bloc/user_list_bloc.dart';
import 'package:flutter_assignment/home/bloc/user_list_event.dart';
import 'package:flutter_assignment/data/user_details.dart';
import 'package:flutter_assignment/home/user_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailsAdapter());
  await Hive.openBox<UserDetails>("user-details");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListBloc()..add(UserListRequest()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: GoogleFonts.workSans().fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.blue,
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.blue,
            elevation: 0,
          ),
        ),
        themeMode: ThemeMode.light,
        home: const UserListView(),
      ),
    );
  }
}
