import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/styles/colors.dart';

class ComposeChat extends StatelessWidget {
  const ComposeChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(left: size.width / 10, right: size.width / 10),
      child: Card(
        shape: StadiumBorder(),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  // textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 1),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'To:',
                    // prefix: Text('Username: '),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.paperplane_fill,
                        size: 20.0,
                      ),
                      color: cPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
