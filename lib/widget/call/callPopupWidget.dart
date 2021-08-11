import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/pages/chat.dart';
import 'package:super_todo/pages/callHistory.dart';
import 'package:super_todo/styles/colors.dart';

Widget bottomNotification(BuildContext context) {
  return new AlertDialog(
    elevation: 0.0,
    insetPadding: EdgeInsets.only(bottom: 240, left: 3),
    contentPadding: EdgeInsets.only(bottom: 0.0, right: 0.0, left: 0.0, top: 2.0),
    titlePadding: EdgeInsets.all(0.0),
    titleTextStyle: TextStyle(fontSize: 20.0,),
    backgroundColor: cSecondary,
    title: AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black26,
      title: Text(
        'Minister Ella',
        style: TextStyle(color: cLight),
      ),
    ),
    content: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            width: 100,
            height: 250,
            padding: EdgeInsets.all(0.0),
            child: Icon(CupertinoIcons.person, size: 200.0, color: cLight,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: cPrimary
            ),
            // padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          ),
        ),
      ],
    ),
    actionsPadding: EdgeInsets.zero,
    actions: <Widget>[
      Expanded(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Chat.route);
          },
          child: Icon(
            CupertinoIcons.captions_bubble_fill, color: cLight,
          ),
        ),
      ),
      Expanded(
        child: TextButton(
          onPressed: () {
          },
          child: Icon(
            CupertinoIcons.phone_fill, color: cLight,
          ),
        ),
      ),
      Expanded(
        child: TextButton(
          onPressed: () {},
          child: Icon(
            CupertinoIcons.video_camera_solid, color: cLight,
          ),
        ),
      ),
      Expanded(
        child: TextButton(
          onPressed: () {},
          child: Icon(
            CupertinoIcons.info_circle_fill, color: cLight,
          ),
        ),
      ),
    ],
  );
}