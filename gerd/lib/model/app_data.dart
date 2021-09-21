import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppData{

  //get menu item list
  List<MenuModule> getModuleList() {

    List<MenuModule> menuList = [];
    menuList.add(MenuModule("Customer","Customer", FontAwesomeIcons.solidUser,"customer","customer"));
    menuList.add(MenuModule("Item","Item", FontAwesomeIcons.cubes,"item","item"));
    // menuList.add(MenuModule("Empty Collection","Empty Collection", FontAwesomeIcons.receipt,
    //     "emptyCollection","emptyCollection"));
    // menuList.add(MenuModule("Invoice","Invoice", FontAwesomeIcons.fileInvoice, "invoice","invoice"));
    // menuList.add(MenuModule("Print\nSummary Report","Print", FontAwesomeIcons.print, "print","print"));

        return menuList;
  }
}

class MenuModule {
  final String moduleName;
  final String navName;
  final IconData iconData;
  final String contextName;
  final String wmsUserSetupName;

  MenuModule(this.moduleName, this.navName, this.iconData, this.contextName, this.wmsUserSetupName);
}