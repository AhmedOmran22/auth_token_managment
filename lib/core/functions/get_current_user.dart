import 'dart:convert';
import 'package:auth_token_managment/core/constants/constants.dart';
import '../../features/auth/data/models/user_model.dart';
import '../services/prefs.dart';

UserModel getCurrentUser() {
  var jsonString = Prefs.getString(kUserData);
  var currentUser = UserModel.fromJson(jsonDecode(jsonString!));
  return currentUser;
}
