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
     
     constraints: BoxConstraints(maxHeight: 200),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            TextFormField(
              textAlign: TextAlign.start,
              style: TextStyle(letterSpacing: 1),
              textCapitalization: TextCapitalization.none,
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5)),
                  labelText: "To: "),
            ),
            TextFormField(
              textAlign: TextAlign.start,
              style: TextStyle(letterSpacing: 1),
              textCapitalization: TextCapitalization.none,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  alignLabelWithHint: true,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5)),
                  labelText: "Message: "),
            ),
          ],
        ),
      ),
    );
  }
}
