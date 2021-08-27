import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/widget/home/compose_chat.dart';
import 'package:super_todo/widget/home/header.dart';
import 'package:super_todo/widget/home/nav_item.dart';
import 'package:super_todo/widget/home/user_item.dart';

class Home extends StatelessWidget {
  static final route = 'home';

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Column(
          children: [
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
      floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.chat_bubble_text),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ComposeChat();
                });
          }),
    );
  }
}
