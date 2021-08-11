import 'package:flutter/material.dart';

class AboutUser extends StatelessWidget {
  static final route = 'about';
  const AboutUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(child: Text('ABOUT USER')),
      ),
    );
  }
}
