import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/models/chat.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:super_todo/widget/home/compose_chat.dart';
import 'package:super_todo/widget/home/header.dart'; 
import 'package:super_todo/widget/home/nav_item.dart';
import 'package:super_todo/widget/home/user_item.dart';

class Home extends StatelessWidget {
  static final route = 'home';

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final textTheme = Theme.of(context).textTheme;

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
                children: List.filled(3, HomeUserItem()),
              ),
            )),
          ],
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavItem(
                  navIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
              )),
              NavItem(
                  navIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chat),
              )),
              NavItem(
                  navIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
              )),
              NavItem(
                  navIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_add,
                      )))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.chat_bubble_text),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("New Message"),
                    content: ComposeChat(),
                    actions: [
                      ElevatedButton.icon(
                        onPressed: () {
                          sendMessage("--MESSAGE--", "--TO--");
                        },
                        icon: Icon(CupertinoIcons.paperplane, size: 20),
                        label: Text("Send"),
                      )
                    ],
                  );
                });
          }),
    );
  }
}

void sendMessage(String message, String to) async {
  final currentUser = fAuth.currentUser;

  if (currentUser == null) return;

  String id = idGenerator(len: 12);
  final date = DateTime.now();

  final sender = Chat(
      id: id,
      uid: currentUser.uid,
      createdAt: date.toString(),
      updatedAt: date.toString(),
      lastModified: date.millisecondsSinceEpoch,
      timestamp: date.millisecondsSinceEpoch);

  final receiver = Chat(
      id: id,
      uid: to,
      createdAt: date.toString(),
      updatedAt: date.toString(),
      lastModified: date.millisecondsSinceEpoch,
      timestamp: date.millisecondsSinceEpoch);

  final batch = fDb.batch();

  batch.set(
      fDb
          .collection(UserCollections)
          .doc(sender.uid)
          .collection(ChatCollections)
          .doc(sender.id),
      sender.toMap());

  batch.set(
      fDb
          .collection(UserCollections)
          .doc(receiver.uid)
          .collection(ChatCollections)
          .doc(receiver.id),
      receiver.toMap());

  await batch.commit();
}
