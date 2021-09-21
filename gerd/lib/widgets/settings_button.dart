import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key key, this.buttonName, this.onTap,
  }) : super(key: key);

  final String buttonName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(4),
      ),
      height: size.height * 0.045,
      width: size.width * 0.3,
      child: TextButton(onPressed: onTap,
        child: Text(buttonName,
          style: middleWhiteTextStyle,
        ),
      ),
    );
  }
}