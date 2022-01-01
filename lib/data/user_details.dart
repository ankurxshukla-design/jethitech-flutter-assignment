import 'package:hive/hive.dart';

part 'user_details.g.dart';

@HiveType(typeId: 0)
class UserDetails extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String accountType;
  @HiveField(3)
  final String age;
  @HiveField(4)
  final String gender;

  UserDetails({
    required this.id,
    required this.name,
    required this.accountType,
    required this.age,
    required this.gender,
  });
}
