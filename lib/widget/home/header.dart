import 'package:flutter/material.dart';
import 'package:super_todo/module/currentUser.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key}) : super(key: key);

  // final user = fAuth.currentUser;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    final user = context.watch<CurrentUser>().user;

    // final username = Utils.emailToUsername(user!.email!);

    return Container(
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
                    Text('${user.name}',
                        style: textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold, color: cMute)),
                    Text('@${user.username}',
                        style: textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold, color: cMute)),
                    Text("Main Account",
                        style: textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold, color: cMute)),
                  ],
                ),
              )),
              CircleAvatar(
                  radius: 30, backgroundImage: NetworkImage(user.photo)),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ));
  }
}
