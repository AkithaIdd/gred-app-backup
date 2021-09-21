import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextInputWithIcon extends StatelessWidget {
  const TextInputWithIcon({
    Key key,
    @required this.icon,
    @required this.hint,
    this.inputType,
    this.inputAction,
    this.textEditingController
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: gray,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: TextField(
            obscuringCharacter: "*",
            controller: textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  icon,
                  size: 18,
                  color: iconColor,
                ),
              ),
              hintText: hint,
              hintStyle: middleTextStyle,
            ),
            style: middleTextStyle,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }

}
