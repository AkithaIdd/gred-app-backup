import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithColor extends StatelessWidget {
  const ButtonWithColor({
    Key key, this.buttonName, this.onTap, this.widthInc, this.heightInc, this. color
  }) : super(key: key);

  final String buttonName;
  final Function onTap;
  final double widthInc;
  final double heightInc;
  final Color color;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(0),
      ),
      height: size.height * heightInc,
      width: size.width * widthInc,
      child: TextButton(onPressed: onTap,
        child: Text(buttonName,
          style: largeWhiteTextStyle,
        ),
      ),
    );
  }
}