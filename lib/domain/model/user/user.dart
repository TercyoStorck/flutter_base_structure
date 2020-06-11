import 'package:base_structure/domain/model/core/guid.dart';

import 'value_objects/user_login.dart';
import 'value_objects/user_name.dart';

class User {
  User({
    this.guid,
    this.name,
    this.login,
  });
  
  Guid guid;
  UserName name;
  UserLogin login;
}