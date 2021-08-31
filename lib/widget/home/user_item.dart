import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/models/chat.dart';
import 'package:super_todo/pages/chat.dart';

import '../../firebase.dart';

class HomeUserItem extends StatelessWidget {
  final Chat chat;
  const HomeUserItem({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
        future: usersCollection.doc(chat.id).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {





          if (snapshot.hasError) {
            return Text("Error occurred loading chat info");
          }




          if (snapshot.hasData) {
            final userDoc = snapshot.data!.data() as dynamic;

            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(ChatPage.route);
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(userDoc['photo']),
                ),
                title: Row(
                  children: [
                    Expanded(child: Text(userDoc['name'] ?? '')),
                    Text(
                      chat.updatedAt ?? '',
                      style: textTheme.caption,
                    )
                  ],
                ),
                subtitle: Text(chat.lastMsg ?? ''),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(CupertinoIcons.bubble_right)),
              ),
            );
          }









          return CircularProgressIndicator();
        });
  }
}
