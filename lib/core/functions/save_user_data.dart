import 'dart:convert';
import '../constants/constants.dart';
import '../services/prefs.dart';

void saveUserData(Map<String, dynamic> data) {
  Prefs.setString(kUserData, json.encode(data));
}
