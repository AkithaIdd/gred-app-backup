import 'package:flutter/material.dart';

class SnackBarWidget {
  BuildContext context;
  String message;

  SnackBarWidget(this.context, this.message);

  static buildSnackbar(context,message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}