import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/helpers/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextInputDate extends StatelessWidget {
  const TextInputDate({
    Key key,
    @required this.hint,
    this.inputType,
    this.inputAction,
    this.backgroundColor,
    this.width,
    this.padding,
    this.height,
    this.textEditingController,
    this.setDate,
    this.readonly,
    this.labelText,
    this.icon,
  }) : super(key: key);

  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color backgroundColor;
  final double width;
  final double padding;
  final double height;
  final TextEditingController textEditingController;
  final Function setDate;
  final bool readonly;
  final String labelText;
  final IconData icon;

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
          readOnly: readonly,
          onTap: setDate,
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                icon,
                size: 18,
                color: iconColor,
              ),
            ),
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: Icon(
            //     icon,
            //     size: 18,
            //     color: iconColor,
            //   ),
            // ),
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
          textInputAction: inputAction
        ),
      );
  }
}
