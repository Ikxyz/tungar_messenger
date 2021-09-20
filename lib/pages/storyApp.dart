import 'package:flutter/material.dart';
import 'package:super_todo/components/storybtn.dart';
import 'package:super_todo/data/storydata.dart';
import 'package:super_todo/pages/storyview.dart';

class StoryApp extends StatefulWidget {
  StoryApp({Key? key}) : super(key: key);

  @override
  _StoryAppState createState() => _StoryAppState();
}

class _StoryAppState extends State<StoryApp> {
  List<StoryData> stories =[
    new StoryData(
      "Benard",
      "https://wallpapercave.com/wp/AYWg3iu.jpg", 
      "https://wallpapercave.com/wp/AYWg3iu.jpg",
      ),

      new StoryData(
      "Victory",
      "https://images.unsplash.com/photo-1631715401341-3c7e4e5542aa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80", 
      "https://wallpapercave.com/wp/AYWg3iu.jpg",
      ),

      new StoryData(
      "Charles",
      "https://images.unsplash.com/photo-1631698350768-c351a5117a92?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80", 
      "https://wallpapercave.com/wp/AYWg3iu.jpg",
      ),

      new StoryData(
      "Carlos",
      "https://images.unsplash.com/photo-1632052871219-f9693a73acca?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80", 
     "https://images.unsplash.com/photo-1631715401341-3c7e4e5542aa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80", 
      ),

      new StoryData(
      "Emerald",
      "https://images.unsplash.com/photo-1628191081071-a2b761bf21d9?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80", 
      "https://wallpapercave.com/wp/AYWg3iu.jpg",
      ),

      new StoryData(
      "Tina",
      "https://images.unsplash.com/photo-1631698350768-c351a5117a92?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80", 
      "https://wallpapercave.com/wp/AYWg3iu.jpg",
      ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                storyButton(stories[0], context),
                storyButton(stories[1], context),
                storyButton(stories[2], context),
                 storyButton(stories[3], context),
                  storyButton(stories[4], context),
                   storyButton(stories[5], context),
              ],
            ),
          )
        ],
      ),
    );
  }
}