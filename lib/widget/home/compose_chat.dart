import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/module/utils.dart';

class ComposeChat extends StatefulWidget {
  const ComposeChat({Key? key}) : super(key: key);

  @override
  _ComposeChatState createState() => _ComposeChatState();
}

class _ComposeChatState extends State<ComposeChat> {
  String msgTo = "";
  String actualMessage = "";

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Text("New Message"),
      content: composeChatField(),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            Utils.sendMessage(message: actualMessage, to: msgTo);
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.paperplane, size: 20),
          label: Text("Send"),
        )
      ],
    );
  }

  Widget composeChatField() {
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
              onChanged: (value) {
                setState(() {
                  msgTo = value.toString();
                });
              },
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
              onChanged: (value) {
                setState(() {
                  actualMessage = value.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
