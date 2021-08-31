import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/components/ChatList.dart';
import '../firebase.dart';
import 'package:super_todo/models/chat.dart';
import 'package:super_todo/models/message.dart';
import 'package:super_todo/module/utils.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:super_todo/widget/home/compose_chat.dart';
import 'package:super_todo/widget/home/header.dart';
import 'package:super_todo/widget/home/user_item.dart';

class Home extends StatefulWidget {
  static final route = 'home';

  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String to = "";
  String message = "";

  /// ----- On To Input Change ------
  /// This function get called each time the use types into to input box
  /// and the text in the box gets passed as an argument to out function
  /// which then save it to the @to variable in our widget using the
  /// setState() function
  void onToInputChange(String val) {
    print("In-APP to: " + val);
    setState(() {
      to = val;
    });
  }

  /// --- On To Input Change End    -----

  /// ------ On Message Input Change -------
  ///  each time the user types into the message input this function get called and the message
  ///   gets passed as an argument to the function
  ///
  /// Which we then save to the variable @to using the setState function
  void onMessageInputChange(String val) {
    print("In-APP MessageHw: " + val);

    setState(() {
      message = val;
    });
  }

  /// ----- On Message Input Change End

  /// ----- On Floating Action Button Click ------
  ///  Shows dialog to enter to and message text
  ///
  void onSendButtonClick() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("New Message"),
            content: ComposeChat(
              toChange: onToInputChange,
              messageChange: onMessageInputChange,
            ),
            actions: [
              ElevatedButton.icon(
                onPressed: () {
                  sendMessage(context, message, to);
                },
                icon: Icon(CupertinoIcons.paperplane, size: 20),
                label: Text("Send"),
              )
            ],
          );
        });
  }

  /// ---- End Floating Action Button Click -----

  /// ----- Widget Build Function --------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            /// Header Widget
            HomeHeader(),

            SizedBox(
              height: 50,
            ),

            Expanded(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [ChatList()],
              ),
            )),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.chat_bubble_text),
          onPressed: () {
            onSendButtonClick();
          }),
    );
  }
}

void sendMessage(BuildContext context, String messageText, String to) async {

  final currentUser = fAuth.currentUser;

  if (currentUser == null) return;
 
  String messageId = idGenerator(len: 16);
  final date = DateTime.now();

  final chat = Chat(
      lastMsg: messageText,
      createdAt: date.toString(),
      updatedAt: date.toString(),
      lastModified: date.millisecondsSinceEpoch,
      timestamp: date.millisecondsSinceEpoch);

  final senderChat = chat.copyWith(Chat(id: to));

  final receiverChat = chat.copyWith(Chat(id: currentUser.uid));

  final message = Message(
      id: messageId,
      msg: messageText,
      isSeen: false,
      isDelivered: false,
      recipient: to,
      sender: currentUser.uid,
      sentAt: date.toString(),
      timestamp: date.millisecondsSinceEpoch,
      type: "text");

  final batch = fDb.batch();

  

  batch.set(
      userChatDocument(currentUser.uid, senderChat.id), senderChat.toMap());

  batch.set(userChatDocument(to, receiverChat.id),
      receiverChat.toMap());

  batch.set(userChatMessageDocument(currentUser.uid, to, message.id!),
      message.toMap());

  batch.set(
      userChatMessageDocument(to, currentUser.uid, message.id!),
      message.toMap());

  await batch.commit();

  print("Message sent");

  
  Navigator.of(context).pop();
}
