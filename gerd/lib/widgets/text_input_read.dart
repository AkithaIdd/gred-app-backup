import 'package:gerd/helpers/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextInputRead extends StatelessWidget {
  const TextInputRead({
    Key key,
    @required this.hint,
    this.inputType,
    this.inputAction,
    this.backgroundColor,
    this.width,
    this.padding,
    this.height,
    this.textEditingController,
    this.isReadOnly,
    this.onTap
  }) : super(key: key);

  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color backgroundColor;
  final double width;
  final double padding;
  final double height;
  final TextEditingController textEditingController;
  final bool isReadOnly;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * width,
      height: height,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(

        maxLines: 2,
        onTap: onTap,
        controller: textEditingController,
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
        ),

        style: middleTextBlackBoldStyle,
        keyboardType: inputType,
        textInputAction: inputAction,
        readOnly: isReadOnly,
      ),
    );
  }
}
