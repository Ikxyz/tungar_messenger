import 'package:flutter/material.dart';
import 'package:super_todo/styles/colors.dart';

enum BubbleType { sender, receiver }

class Bubble extends StatelessWidget {
  final BubbleType type;
  final String msg;

  const Bubble({Key? key, required this.msg, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = this.type == BubbleType.receiver ? cPrimary : cMute;
    final alignment = this.type == BubbleType.receiver
        ? Alignment.centerLeft
        : Alignment.centerRight;
    final borderRadius = this.type == BubbleType.receiver
        ? BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          )
        : BorderRadius.only(
      topLeft: Radius.circular(15.0),
      topRight: Radius.circular(0.0),
      bottomLeft: Radius.circular(15.0),
      bottomRight: Radius.circular(15.0),
    );
    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
        ),
        padding: EdgeInsets.all(15.0),
        child: Text(
          msg,
          style: TextStyle(
            color: cLight,
          ),
        ),
      ),
    );
  }
}
