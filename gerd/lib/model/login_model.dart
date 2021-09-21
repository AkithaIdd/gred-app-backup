

class LoginResponse{

  final int status;
  final String message;
  final List<DSRModel> navUrlList;

  static DSRModel userModal;

  LoginResponse({this.status, this.message, this.navUrlList});

  factory LoginResponse.fromJson(Map<String, dynamic> item){
    final navUrlList = <DSRModel>[];

    if(item['value'] != null) {
      for (var item in item['value']) {

        final navUrl = DSRModel(item['Id'], item['DSRNo'], item['DSRName'],
            item['Password'], item['CACode'], item['CAName'], item['Address'],10000, 10000);
        navUrlList.add(navUrl);
      }
    }
    return LoginResponse(
        status: 1,
        message: "received",
        navUrlList: navUrlList
    );
  }

}

class DSRModel{
   int id;
   String dsrNo;
   String dsrName;
   String password;
   String caCode;
   String caName;
   String caAddress;
   int runningReceiptNo;
   int runningDepositNo;

  DSRModel(this.id, this.dsrNo, this.dsrName, this.password, this.caCode,this.caName, this.caAddress,
      this.runningReceiptNo, this.runningDepositNo);

  DSRModel.withId(this.id,this.dsrNo, this.dsrName, this.password, this.caCode);

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["username"] = dsrNo;
    map["password"] = password;
    map["dsrName"] = dsrName;
    map["caCode"] = caCode;
    map["caName"] = caName;
    map["caAddress"] = caAddress;
    map["runningReceiptNo"] = runningReceiptNo;
    map["runningDepositNo"] = runningDepositNo;

    return map;
  }

  DSRModel.fromJson(Map<String, dynamic> item){
    this.id = item['id'];
    this.dsrNo = item['username'];
    this.dsrName = item['dsrName'];
    this.password = item['password'];
    this.caCode = item['caCode'];
    this.caName = item['caName'];
    this.caAddress = item['caAddress'];
    this.runningDepositNo = int.parse(item['runningDepositNo']);
    this.runningReceiptNo = int.parse(item['runningReceiptNo']);
  }
}



