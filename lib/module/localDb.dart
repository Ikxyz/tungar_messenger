import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_todo/models/user.dart';
import 'package:super_todo/module/currentUser.dart';

class LocalDb {
  static late SharedPreferences _store;

  static init() async {
    _store = await SharedPreferences.getInstance();
  }

// * Save user to storage
  static save(UserModel user) async {
    String jsonData = jsonEncode(user);

    _store.setString("loggedInUser", user.toJson());
  }

// * check if any user exists in storage
  static getUser(BuildContext context) {
    String? storedUser = _store.getString("loggedInUser");

    if (storedUser == null) return null;

    final user = jsonDecode(storedUser);

    context.watch<CurrentUser>().setUser(user);
    // return user;
  }

// * delete user from storage after logout
  static deleteUser() {
    _store.clear();
  }
}
