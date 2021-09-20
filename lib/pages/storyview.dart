import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_todo/data/storydata.dart';
class StoryView extends StatefulWidget {
  StoryView({Key? key, required this.story}) : super(key: key);
    final StoryData story;
  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
 double percent = 0.0;
 late Timer _timer;
void startTimer(){
  _timer = Timer.periodic(Duration(milliseconds: 10), (timer) { 
    setState(() {
      percent += 0.001;
      if(percent > 1){
        _timer.cancel();
        Navigator.pop(context);
      }
    });
  });
}
@override
  void initState() {
    startTimer();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.story.storyUrl),
                fit: BoxFit.cover
                )
            ),
          ),
         Padding(
        padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0 ),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: percent,
            ),
            SizedBox(height: 8.0,),
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(widget.story.avatarUrl),
                radius: 30.0,
                ),
                SizedBox(width: 8.0,),
                Text(widget.story.userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
                ),
                )
              ],
            )
          ],
        ),
      ),
      ],
      )
    );
  }
}