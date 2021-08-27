import 'package:flutter/material.dart';
import 'package:super_todo/styles/colors.dart';

Widget? loadingIndicator(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(120),
          backgroundColor: Colors.black12,
          content: CircularProgressIndicator(
            color: cAccent,
            strokeWidth: 8,
          ),
        );
      });
}
