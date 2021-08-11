import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/pages/chat.dart';
import 'package:super_todo/widget/call/callPopupWidget.dart';

class UserCallLog extends StatelessWidget {
  final Icon icon;
  const UserCallLog({Key? key, required this.icon}) : super(key: key);

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
          ],
        ),
        subtitle: Row(
          children: [
            this.icon,
            Text('Today, 1:57 pm')
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.phone_fill,
            color: Colors.green,
          ),
        ),
      ),
    );
    ;
  }
}
