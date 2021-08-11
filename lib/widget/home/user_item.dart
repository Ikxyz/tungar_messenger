import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/pages/chat.dart';
import 'package:super_todo/widget/userPopupWidget.dart';

class HomeUserItem extends StatelessWidget {
  const HomeUserItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(Chat.route);
        },
        leading: CircleAvatar(
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => bottomNotification(context),
              );
            },
            icon: Icon(
              CupertinoIcons.person,
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text("Minister Ella"),
            ),
            Text(
              "23 mins ago",
              style: textTheme.caption,
            ),
          ],
        ),
        subtitle: Text("I couldn't get to him on time, I'm sorry.... "),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.bubble_right,
          ),
        ),
      ),
    );
  }
}
