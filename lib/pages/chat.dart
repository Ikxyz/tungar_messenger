import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:super_todo/widget/chat/bubble.dart';

class ChatPage extends StatelessWidget {
  static final String route = "chat";
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(),
            title: Text("Tovia David"),
            subtitle: Text("Online"),
            tileColor: cPrimary,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.receiver),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(letterSpacing: 1),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        hintText: "type here....",
                        hintStyle: textTheme.bodyText2!.copyWith(color: cMute),
                        suffix: IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.paperplane, size: 20))),
                  ),
                ),
              ],
            ),
          )
        ],
      ))),
    );
  }
}
