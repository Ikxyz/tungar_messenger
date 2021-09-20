import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_todo/module/currentUser.dart';
import 'Login.dart';

class Profile extends StatelessWidget {
  static const String route = "profile";

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<CurrentUser>();
    final user = currentUser.user;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(user.photo),
            ),
            SizedBox(
              height: 20,
            ),
            Text(user.name,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black)),
            Text('@${user.username}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.black)),
            SizedBox(
              height: 50,
            ),

            ListTile(
                title: Text('Change Username'),
                subtitle: Text('modify your current account username ')),

            SizedBox(
              height: 50,
            ),

            /// Logout Button
            ElevatedButton(
              child: Text('Logout'),
              onPressed: () {
                currentUser.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Login.route, (route) => false);
              },
            )
          ],
        ),
      ),
    ));
  }
}
