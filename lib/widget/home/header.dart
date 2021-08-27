import 'package:flutter/material.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/module/utils.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:super_todo/widget/home/profile.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key}) : super(key: key);

  final user = fAuth.currentUser;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    final username =
        Utils.usernameShorten(Utils.emailToUsername(user!.email!), 10);

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${user!.displayName}',
                        style: textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold, color: cBlack)),
                    Text(username,
                        style: textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold, color: cBlack)),
                    Text(user!.isAnonymous ? "Guest Account" : "Main Account",
                        style: textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold, color: cBlack)),
                  ],
                ),
              )),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Profile(isAnonymous: user!.isAnonymous);
                      });
                },
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    backgroundImage: NetworkImage(user!.photoURL!)),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ));
  }
}
