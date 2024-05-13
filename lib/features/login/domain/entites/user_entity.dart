import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity{
  @HiveField(0)
  String userName;
  @HiveField(1)
  String? userNumber;


  UserEntity({required this.userName, this.userNumber,});
}