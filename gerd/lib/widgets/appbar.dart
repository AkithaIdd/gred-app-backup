import 'package:gerd/helpers/helpers.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{

  final Function onPressed;
  final String title;
  const AppBarWidget({Key key, this.onPressed, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(title,style: largeWhiteTextStyle,),
      centerTitle: true,
      backgroundColor: primary,
      elevation: 0,
      leading: IconButton(
        onPressed:onPressed,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
