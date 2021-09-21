
import 'package:gerd/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/model/app_data.dart';
import 'package:gerd/model/item_item.dart';
import 'package:gerd/model/login_model.dart';
import 'package:gerd/widgets/widgets.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  DSRModel _dsrModel;
  List<MenuModule> moduleList = [];
  var _isLoading = false;
  AlertDialog alert;
  ShowToast toast = new ShowToast();



  ItemResponse _itemResponse;


  String searchSubCategory = "Deposit Daily Summary";
  var itemSubCategoryList = [];
  TextEditingController _dateController = new TextEditingController();
  String lastSyncedTime = "";
  // LoginService get service => GetIt.I<LoginService>();
  // APIResponse<UserAuthResponse> _apiResponse;

  @override
  void initState() {
    _fetchItem();
    super.initState();
  }

  void _fetchItem() async {
    setState(() {
      _isLoading = true;
    });

    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    // _dsrModel = ModalRoute.of(context).settings.arguments;
    LoginResponse.userModal = _dsrModel;
    moduleList = AppData().getModuleList();
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async =>
        await  showDialog(context: context,
        builder: (BuildContext context) {
        return  dialogLogout();
        }),
    child:Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Container(
            height: 78,
            decoration: BoxDecoration(
              color: primary,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      width: size_36,
                      height: size_36,
                      margin: EdgeInsets.only(left: 8),
                      child: Text(""),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Text(
                        "Gerd App",
                        style: largeWhiteTextStyle,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: size_36,
                        height: size_36,
                        margin: EdgeInsets.only(right: 8),
                        child: IconButton(
                            color: toolBarIcon,
                            icon: new Icon(FontAwesomeIcons.powerOff),
                            onPressed: () async{
                              await  showDialog(context: context,
                                  builder: (BuildContext context) {
                                return  dialogLogout();
                              });
                            }),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 16, top: 12),
                      child: Row(children: [
                        Icon(
                          FontAwesomeIcons.solidUserCircle,
                          size: 18,
                          color: white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "test",
                            style: middleWhiteTextStyle,
                          ),
                        ),
                      ]),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 8, top: 12),
                      child: Row(children: [
                        // Icon(
                        //   FontAwesomeIcons.database,
                        //   size: 18,
                        //   color: white,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            '',
                            style: middleWhiteTextStyle,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        Container(height: 2,width: size.width, color: accentColor,),

    // ignore: missing_return
    Builder(builder: (_) {

    // if (_isLoading) {
    // return Center(child: CircularProgressIndicator());
    // }
    //
    // if (_apiResponse?.error) {
    // return Center(child: Text(_apiResponse.errorMessage));
    // }
    // if (_apiResponse?.data != null &&
    // _apiResponse?.data.userAuth != null) {
    //
    //   var userAuth = _apiResponse?.data.userAuth;
    //   for (var navModule in navUrl.navModules){
    //     for(var localModule in menuModel.getModuleList()){
    //       if(navModule.name == localModule.navName){
    //
    //         if(userAuth.wmsItem){
    //           if("wmsItem" == localModule.wmsUserSetupName) {
    //             moduleList.add(localModule);
    //           }
    //         }
    //
    //         if(userAuth.wmsProduction){
    //            if("wmsProduction" == localModule.wmsUserSetupName) {
    //              moduleList.add(localModule);
    //            }
    //         }
    //         if(userAuth.wmsApproval){
    //            if("wmsApproval" == localModule.wmsUserSetupName) {
    //              moduleList.add(localModule);
    //             }
    //         }
    //
    //         if(userAuth.wmsSalesDelivery){
    //           if("wmsSalesDelivery" == localModule.wmsUserSetupName) {
    //             moduleList.add(localModule);
    //           }
    //         }
    //
    //         if(userAuth.wmsPurchReceipt){
    //           if("wmsPurchReceipt" == localModule.wmsUserSetupName) {
    //             moduleList.add(localModule);
    //           }
    //         }
    //
    //       }
    //     }
    //   }
      // ignore: missing_return
      return Container(
        height: size.height - 135,
        color: background,
        width: size.width,

        child: GridView.count(
            crossAxisCount: 2,
            semanticChildCount: 1,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            children: List.generate(moduleList.length, (index) {
              return Center(
                child: SelectCard(choice: moduleList[index]),
              );
            }
            )
        ),
      );
    //   } else {
    //   return Center(child: Text("Item List empty!"));
    // }
          }),
          // Container(
          //   alignment: Alignment.bottomCenter,
          //   height: 55,
          //   decoration: BoxDecoration(
          //     color: primary,
          //   ),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Row( children: [
          //       Padding(
          //         padding: const EdgeInsets.only(left: 8.0),
          //         child: Container(
          //           margin: EdgeInsets.only(left: 8),
          //           child: ButtonWithColor(
          //               buttonName: SyncAll,
          //               onTap: () async{
          //                       await  showDialog(context: context,
          //                           builder: (BuildContext context) {
          //                             return  dialogSync();
          //                           });
          //               },
          //               widthInc: 0.25,
          //               heightInc: 0.059,
          //               color: heinkenBlue
          //           ),
          //           // child: IconButton(
          //           //     color: toolBarIcon,
          //           //     icon: new Icon(FontAwesomeIcons.sync),
          //           //     onPressed: () async{
          //           //       await  showDialog(context: context,
          //           //           builder: (BuildContext context) {
          //           //             return  dialogSync();
          //           //           });
          //           //     }),
          //         ),
          //       ),
          //       Spacer(),
          //       Text(
          //         "Synced Time: " + lastSyncedTime ,
          //         style: smallWhiteTextStyle,
          //       ),
          //       SizedBox(width: 8,),
          //     ],)
          //   ),
          // )
        ],
      ),
    )
    );
  }


  // Sign Out dialog box
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

  // Sync dialog box
  Widget dialogSync() {

    return  AlertDialog(
      title: Text(dataSync),
      content: const Text(
          notification_msg_confirmation_force_sync),
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
            Navigator.pop(context, false);
          },
        )
      ],
    );
  }




  showLoaderDialog(BuildContext context){
    alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

}

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final MenuModule choice;

  @override
  Widget build(BuildContext context) {

    return Material(
        color: Colors.white.withOpacity(0.0),
    child: InkWell(
      hoverColor: primary,
      splashColor: primary,
      onTap: () {
        Navigator.pushNamed(context, choice.contextName);

      },
      child:Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primary, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        color: heinkenGray,
        child: Center(child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Icon(choice.iconData, size:44.0, color: heinkenBlue),
              SizedBox(height: 12,),
              Text(choice.moduleName, style: largeBlueTextStyle,textAlign: TextAlign.center,),
            ]
        ),
        ),
        ),
    ));
  }


}