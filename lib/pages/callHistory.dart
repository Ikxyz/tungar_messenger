import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/widget/call/user_call_log.dart';

class CallHistory extends StatelessWidget {
  static final route = "callHistory";
  const CallHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text("Call History"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
        children: [
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.green,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_down_left,
                color: Colors.red,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.green,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_down_left,
                color: Colors.red,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.green,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_down_left,
                color: Colors.red,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.green,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_down_left,
                color: Colors.red,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.green,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_down_left,
                color: Colors.red,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.green,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_down_left,
                color: Colors.red,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.green,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_down_left,
                color: Colors.red,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.green,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_down_left,
                color: Colors.red,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.green,
              ),
            ),
            UserCallLog(
              icon: Icon(
                CupertinoIcons.arrow_down_left,
                color: Colors.red,
              ),
            ),
        ],
      ),
          )),
    );
  }
}
