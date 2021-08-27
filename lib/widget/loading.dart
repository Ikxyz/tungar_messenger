
import 'package:flutter/material.dart';
import 'package:super_todo/styles/colors.dart';

Widget? loadingIndicator(BuildContext context) {
  showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            // backgroundColor: Colors.transparent,
            content: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: cAccent,
                strokeWidth: 8,
              ),
            ),
          );
        });
}