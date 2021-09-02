import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/models/chat.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:super_todo/widget/chat/bubble.dart';

class ChatPage extends StatefulWidget {
  static final String route = "chat";

  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final Chat chatInfo;
  late final chattingWithUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

 final args = ModalRoute.of(context)!.settings.arguments as List;

    chatInfo ??= args[0] as Chat;
    chattingWithUser ??= args[1] as Map<String, dynamic>;


    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chattingWithUser['photo']),
            ),
            title: Text(chattingWithUser['name']),
            subtitle: Text("Online"),
            tileColor: cPrimary,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Bubble(
                      msg:
                          "Hello Bro! how you're doing, Hello Bro! how you're doingHello Bro! how you're doingHello Bro! how you're doingHello Bro! how you're doingHello Bro! how you're doingHello Bro! how you're doingHello Bro! how you're doingHello Bro! how you're doing",
                      type: BubbleType.receiver),
                  Bubble(
                      msg: "Hello Bro! how you're doing",
                      type: BubbleType.sender),
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
