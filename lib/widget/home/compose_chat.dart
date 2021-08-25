import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final inputDecoration = InputDecoration(
    alignLabelWithHint: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 5)),
    labelText: "");

// typedef InputChange = void Function(String val);

class ComposeChat extends StatelessWidget {
  final Function(String val) toChange;
  final Function(String val) messageChange;

  const ComposeChat(
      {Key? key, required this.toChange, required this.messageChange})
      : super(key: key);

  void onToInputChange(String val) {
    print(val);
    this.toChange(val);
  }

  void onMessageInputChange(String val) {
    print(val);
    this.messageChange(val);
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final textTheme = Theme.of(context).textTheme;

    return Container(
      constraints: BoxConstraints(maxHeight: 200),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            TextFormField(
              onChanged: (val) {
                onToInputChange(val);
              },
              style: TextStyle(letterSpacing: 1),
              decoration: inputDecoration.copyWith(labelText: "To: "),
            ),
            TextFormField(
              onChanged: (val) {
                onMessageInputChange(val);
              },
              style: TextStyle(letterSpacing: 1),
              minLines: 3,
              maxLines: 5,
              decoration: inputDecoration.copyWith(labelText: "Message: "),
            ),
          ],
        ),
      ),
    );
  }
}
