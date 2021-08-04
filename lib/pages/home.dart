import 'package:flutter/material.dart';
import 'package:super_todo/styles/colors.dart';

class Home extends StatelessWidget {
  static final route = 'home';

  const Home({Key? key}) : super(key: key);

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
            Container(
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
                            Text("John Paul",
                                style: textTheme.headline4!.copyWith(
                                    fontWeight: FontWeight.bold, color: cMute)),
                            Text("@eyesofthegods",
                                style: textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.bold, color: cMute)),
                            Text("Big money man",
                                style: textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.bold, color: cMute)),
                          ],
                        ),
                      )),
                      CircleAvatar(
                          radius: 30, child: Icon(Icons.person, size: 50)),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                )),
            Container(
                padding: EdgeInsets.only(
                    left: size.width / 10, right: size.width / 10),
                child: Card(
                  shape: StadiumBorder(),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFormField(
                          style: TextStyle(letterSpacing: 1),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefix: Text('Username: '),
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.send)),
                          ),
                        ),
                      )),
                    ],
                  ),
                )),
            Expanded(
                child: SingleChildScrollView(
              child: Column(),
            )),
            Container(
              color: Colors.red,
              width: size.width,
              height: 100,
              child: Text("Footer"),
            )
          ],
        )),
      ),
    );
  }
}
