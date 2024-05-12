import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity{
  @HiveField(0)
  final String userName;

  UserEntity({required this.userName});
}