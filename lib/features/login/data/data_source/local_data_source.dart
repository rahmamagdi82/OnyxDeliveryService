import 'package:hive_flutter/hive_flutter.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';

import '../../../../core/utils/constants.dart';

abstract class LoginLocalDataSource{
UserEntity checkLogin();
void setLoginData(UserEntity userEntity);
}

class LoginLocalDataSourceImp extends LoginLocalDataSource{
  @override
  UserEntity checkLogin() {
    var box = Hive.box<UserEntity>(AppConstants.loginBox);
    return box.getAt(0)!;
  }

  @override
  void setLoginData(UserEntity userEntity) {
    var box = Hive.box<UserEntity>(AppConstants.loginBox);
    box.add(userEntity);
  }

}