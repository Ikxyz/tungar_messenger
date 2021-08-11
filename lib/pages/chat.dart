import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:super_todo/widget/chat/bubble.dart';

class Chat extends StatelessWidget {
  static final String route = 'chat';
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(),
                title: Text('Minister Ella'),
                subtitle: Text('online'),
                tileColor: cPrimary,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                            "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.receiver,
                      ),
                      Bubble(
                        msg:
                        "Hello Babe, how're you doing? \n Hope your day is going well?",
                        type: BubbleType.sender,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(letterSpacing: 1.0),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0.0),
                          hintText: 'type here...........',
                          hintStyle:
                              textTheme.bodyText2!.copyWith(color: cMute),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.paperplane,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
