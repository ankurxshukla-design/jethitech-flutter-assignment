import 'package:flutter_assignment/data/user_details.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<UserDetails> getUserDetailsBox() =>
      Hive.box<UserDetails>("user-details");
}
