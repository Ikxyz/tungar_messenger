import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/models/user.dart';

class CurrentUser extends ChangeNotifier {
  late UserModel _user;

  get user => _user;

  void setUser(Map<String, dynamic> user) {
    this._user = UserModel.fromMap(user);
    notifyListeners();
  }

  void logout() {
    this._user.toMap().clear();
    // LocalDb.deleteUser();
    notifyListeners();
  }
}
