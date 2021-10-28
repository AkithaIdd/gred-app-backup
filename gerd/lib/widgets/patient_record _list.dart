import 'package:flutter/material.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/model/patient.dart';
import 'package:intl/intl.dart';

class NewPatientRecordList extends StatefulWidget {
  const NewPatientRecordList({Key key}) : super(key: key);

  @override
  _NewPatientRecordListState createState() => _NewPatientRecordListState();
}

class _NewPatientRecordListState extends State<NewPatientRecordList> {
  bool _isLoading = false;

  final List<Patient> itemLineList = [
    Patient(
      id: 'p1',
      testDate: DateTime.now(),
      ageOfOnset: 50,
      damageLength: 20,
    ),
    Patient(
      id: 'p2',
      testDate: DateTime.now(),
      ageOfOnset: 60,
      damageLength: 40,
    ),
    Patient(
      id: 'p3',
      testDate: DateTime.now(),
      ageOfOnset: 70,
      damageLength: 70,
    ),
    // Patient(
    //   id: 'p1',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 50,
    //   damageLength: 20,
    // ),
    // Patient(
    //   id: 'p2',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 60,
    //   damageLength: 40,
    // ),
    // Patient(
    //   id: 'p3',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 70,
    //   damageLength: 70,
    // ),
    // Patient(
    //   id: 'p1',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 50,
    //   damageLength: 20,
    // ),
    // Patient(
    //   id: 'p2',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 60,
    //   damageLength: 40,
    // ),
    // Patient(
    //   id: 'p3',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 70,
    //   damageLength: 70,
    // ),
  ];
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(

        color: Colors.transparent,
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Builder(builder: (_) {
          if (_isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // if (itemLineList != null) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            // scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            itemCount: itemLineList.length,
            itemBuilder: (context, index) {
              // txtReturnQty = TextEditingController();
              // txtReturnQty.text = itemLineList[index].qty.toString();
              return InkWell(
                onTap: () {},
                child: Card(
                  margin: EdgeInsets.only(bottom: size_8),
                  child: Row(
                    children: <Widget>[
                      // Expanded(
                      //   flex: 2,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 8.0),
                      //     child: Image(
                      //       image: AssetImage(itemLineList[index].path),
                      //       fit: BoxFit.contain,
                      //       width: 100,
                      //       height: 100,
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            Container(
                              padding:
                              EdgeInsets.only(
                                  right: horizontal_space, top: size_4),
                              child: Row(children: [
                                SizedBox(width: 8),
                                Text(
                                  'Date of Test :',
                                  style: smallTextBlackStyle,
                                ),
                                Flexible(
                                  child: Text(
                                    DateFormat.yMMMd().format(
                                        itemLineList[index].testDate),

                                    style: smallTextBlackBoldStyle,
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              padding:
                              EdgeInsets.only(right: horizontal_space),
                              child: Row(children: [
                                SizedBox(width: 8),
                                Text(
                                  'Age Of Onset :',
                                  style: smallTextBlackStyle,
                                ),
                                Text(
                                  itemLineList[index]
                                      .ageOfOnset
                                      .toString(),
                                  style: smallTextBlackBoldStyle,
                                ),
                                Spacer(),
                              ]),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  right: horizontal_space,
                                  top: size_4,
                                  bottom: size_4),
                              child: Row(children: [
                                SizedBox(width: 8),
                                Text(
                                  'length of LES damage :',
                                  style: smallTextBlackStyle,
                                ),
                                Text(
                                  itemLineList[index]
                                      .damageLength
                                      .toString(),
                                  style: smallTextBlackBoldStyle,
                                ),

                                // TextInputSearch(
                                //   hint: '',
                                //   inputType: TextInputType.number,
                                //   inputAction: TextInputAction.next,
                                //   backgroundColor: Colors.white,
                                //   width: 0.2,
                                //   padding: 0,
                                //   height: size_32,
                                //   // textEditingController: txtReturnQty,
                                //   isReadOnly: false,
                                //   onChanged: (text) {
                                //     // if(Customer.selectedCustomer == null){
                                //     //   toast.showToast("Select Customer first");
                                //     //   return;
                                //     // }
                                //     if (text != null &&
                                //         text.toString() != "") {
                                //       itemLineList[index].age =
                                //           int.parse(text);
                                //     }
                                //   },
                                // ),
                                Spacer(),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  color: Colors.white,
                ),
              );
            },
          );
          // }
          // else {
          //   return Center(child: Text("Item List empty!"));
          // }
        }),
      ),
    );
  }
}
