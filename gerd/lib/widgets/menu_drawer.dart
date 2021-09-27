
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/helpers/style.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key key}) : super(key: key);

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Drawer(

        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: primaryLight),

              child: Container(
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      elevation: 10,
                      child: Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('assets/user.png'),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'User Name',
                      style: smallTextBlackBoldStyle,
                    ),)

                  ],
                ),
              )
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: largeTextBlackBoldStyle,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Change Password',
                style: largeTextBlackBoldStyle,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Logout',
                style: largeTextBlackBoldStyle,
              ),
              onTap: () async{
                await  showDialog(context: context,
                    builder: (BuildContext context) {
                      return  dialogLogout();
                    });



                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget dialogLogout() {

    return  AlertDialog(
      title: Text(confirmation),
      content: const Text(
          doYouWishToSignOut),
      actions: <Widget>[
        TextButton(
          child: const Text(no),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        TextButton(
          child: const Text(yes),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        )
      ],
    );
  }
}
