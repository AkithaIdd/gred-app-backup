import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({
    Key key,
    this.text,
    this.title,
    this.onPress,
    this.btn,

  }) : super(key: key);

  final String title;
  final String text;
  final String btn;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title:  Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text(text),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child:  Text(btn),
            onPressed: onPress,
          ),
        ],
      ),
    );
  }
}

