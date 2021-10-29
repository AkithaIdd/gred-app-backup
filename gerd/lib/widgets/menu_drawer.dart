import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      color: primaryLight,
      child: Drawer(
        child: Container(
          color: Colors.blue[50],
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: white),
                child: Container(
                  child: Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/user.png',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          Preference.getString('username'),
                          style: smallTextBlackBoldStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Update the state of the app
                  Navigator.pushReplacementNamed(context, 'profile');
                  // Then close the drawer
                  // Navigator.pop(context);
                },
                child: InkWell(
                  onTap: () {
                    // Update the state of the app
                    Navigator.pushReplacementNamed(context, 'profile');
                    // Then close the drawer
                    // Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FontAwesomeIcons.solidUser,
                        color: Colors.blue[800],
                        size: 25,
                      ),
                      Text('Profile'),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Update the state of the app
                  Navigator.pushReplacementNamed(context, 'profile');
                  // Then close the drawer
                  // Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidUser,
                      color: Colors.blue[800],
                      size: 25,
                    ),
                    Text('Change Password'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Update the state of the app
                  Navigator.pushReplacementNamed(context, 'profile');
                  // Then close the drawer
                  // Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidUser,
                      color: Colors.blue[800],
                      size: 25,
                    ),
                    Text('Logout'),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        FontAwesomeIcons.solidUser,
                        color: Colors.blue[800],
                        size: 25,
                      ),
                      title: const Text(
                        'Profile',
                        style: largeTextBlackBoldStyle,
                      ),
                      onTap: () {
                        // Update the state of the app
                        Navigator.pushReplacementNamed(context, 'profile');
                        // Then close the drawer
                        // Navigator.pop(context);
                      },
                    ),
                    Divider(
                      color: Colors.blue[400],
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        FontAwesomeIcons.lockOpen,
                        color: Colors.blue[800],
                        size: 25,
                      ),
                      title: const Text(
                        'Change Password',
                        style: largeTextBlackBoldStyle,
                      ),
                      onTap: () {
                        // Update the state of the app
                        Navigator.pushReplacementNamed(
                            context, 'changePassword');
                        // Then close the drawer
                        // Navigator.pop(context);
                      },
                    ),
                    Divider(
                      color: Colors.blue[400],
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        FontAwesomeIcons.signOutAlt,
                        color: Colors.blue[800],
                        size: 25,
                      ),
                      title: const Text(
                        'Logout',
                        style: largeTextBlackBoldStyle,
                      ),
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return dialogLogout();
                            });

                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        // Navigator.pop(context);
                      },
                    ),
                    Divider(
                      color: Colors.blue[400],
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dialogLogout() {
    return AlertDialog(
      title: Text(confirmation),
      content: const Text(doYouWishToSignOut),
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
