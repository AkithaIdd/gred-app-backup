import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabButtonC extends StatelessWidget {
  const TabButtonC({
    Key key, this.buttonName, this.onTap, this.heightInc,this.color ,this.colorText
  }) : super(key: key);

  final String buttonName;
  final Function onTap;
  final double heightInc;
  final Color color;
  final Color colorText;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(0),
      ),
      height: size.height * heightInc,
      child: TextButton(onPressed: onTap,
        child: Text(buttonName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorText,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}