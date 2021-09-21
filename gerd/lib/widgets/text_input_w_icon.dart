import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextInputWRightIcon extends StatelessWidget {
  const TextInputWRightIcon({
    Key key,
    @required this.hint,
    @required this.icon,
    this.inputType,
    this.inputAction,
    this.backgroundColor,
    this.width,
    this.padding,
    this.height,
    this.textEditingController,
    this.onTap,
    this.onChanged,
    this.isReadOnly
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color backgroundColor;
  final double width;
  final double padding;
  final double height;
  final TextEditingController textEditingController;
  final Function onTap;
  final Function onChanged;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      width: size.width * width,
      height: height,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: textEditingController,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 8,left: 8),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 0.0),
          ),
          hintText: hint,
          hintStyle: middleTextStyle,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              icon,
              size: 18,
              color: iconColor,
            ),
          ),
        ),

        style: middleTextBlackBoldStyle,
        keyboardType: inputType,
        textInputAction: inputAction,
        readOnly: isReadOnly,
        enableInteractiveSelection: isReadOnly,
      ),
    );
  }

}
