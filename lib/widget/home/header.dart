import 'package:flutter/material.dart';
import 'package:super_todo/styles/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

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
                  Text(
                    "John Paul",
                    style: textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cMute,
                    ),
                  ),
                  Text(
                    "@eyesofthegods",
                    style: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cMute,
                    ),
                  ),
                  Text(
                    "Big money man",
                    style: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cMute,
                    ),
                  ),
                ],
              ),
            )),
            CircleAvatar(radius: 30, child: Icon(Icons.person, size: 50)),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
