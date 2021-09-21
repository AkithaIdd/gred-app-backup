import 'package:gerd/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key key, @required this.customIcon,  this.onTap, this.margin
  }) : super(key: key);

  final IconData customIcon;
  final Function onTap;
  final double margin;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: margin),
      decoration: BoxDecoration(
        color: appTextAndIcon,
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      height: 36,
      width: 36,
      child: IconButton(
        focusColor: primary,
        alignment: Alignment.center,
        iconSize: 20,
        icon: new Icon(customIcon,),
        onPressed:onTap,
        color: iconColor,
      ),
    );
  }
}