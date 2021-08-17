import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:super_todo/widget/home/compose_chat.dart';
import 'package:super_todo/widget/home/header.dart';
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
            HomeHeader(),
            SizedBox(
              height: 30,
            ),
            ComposeChat(),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                  HomeUserItem(),
                ],
              ),
            )),
          ],
        )),
      ),
    );
  }
}
