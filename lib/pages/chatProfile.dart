import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/models/user.dart';
import 'package:super_todo/module/utils.dart';

class ChatProfile extends StatefulWidget {
  static final String route = 'chatProfile';

  ChatProfile({Key? key}) : super(key: key);

  @override
  _ChatProfileState createState() => _ChatProfileState();
}

class _ChatProfileState extends State<ChatProfile> {
  UserModel? chattingWithUserInfo;

  @override
  Widget build(BuildContext context) {
    chattingWithUserInfo ??=
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // backgroundColor: Colors.white,
              pinned: true,
              snap: false,
              floating: true,
              elevation: 0.0,
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: EdgeInsets.only(left: 30.0, bottom: 20.0),
                title: Text(
                  chattingWithUserInfo!.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                background: InkWell(
                  onTap: () {},
                  child: Image(
                    // color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    image: NetworkImage(
                      chattingWithUserInfo!.photo,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 5.0,
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Last Seen',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Text(
                        '20 September 2021',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Text('1:25AM',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'About and email address',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('About User......',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black87)),
                            subtitle: Text('20 September 2021',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          Divider(),
                          ListTile(
                              title: Text(
                                chattingWithUserInfo!.username,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black87),
                              ),
                              subtitle: Text('Username',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                  )),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.bubble_left_bubble_right_fill),
                                color: Colors.red,
                              )),
                          Divider(),
                          ListTile(
                              title: Text(
                                chattingWithUserInfo!.email,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black87),
                              ),
                              subtitle: Text('Email',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                  )),
                             ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    // color: Colors.red,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.block_rounded,
                                size: 25.0,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                'Block',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
