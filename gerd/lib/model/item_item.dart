
class ItemResponse{

  final List<Item> itemList;

  ItemResponse({this.itemList});

  factory ItemResponse.fromJson(Map<String, dynamic> item){
    var itemList =  <Item>[];
    for (var item in item['value']){

      String path;
      if(item['ItemName'].toString().contains("Bottle")){
        path = "assets/empty_bottle.png";
      }else{
        path = "assets/empty_crates.png";
      }

      var itemSet = Item(item['ItemNo'], item['ItemName'],
          item['BaseUnitofMeasure'], item['UnitCost'].toDouble(), 0,
          0,path);
      itemList.add(itemSet);
    }

    return ItemResponse(itemList: itemList);
  }

}

class Item {
  int id;
  String no;
  String name;
  String uom;
  double price;
  double outstandingBal ;
  int openingBal ;
  String path;
  String productGroupCode;
  String lastDateModified;
  String inventoryPostingGroup;
  String pOType;
  String description2;
  bool gblnIsItemTrackingRequired;


  Item(this.no, this.name, this.uom, this.price,
      this.outstandingBal, this.openingBal,this.path);


  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["no"] = no;
    map["name"] = name;
    map["uom"] = uom;
    map["price"] = price;
    map["outstandingBal"] = outstandingBal;
    map["openingBal"] = openingBal;
    map["path"] = path;

    return map;
  }

  Item.fromJson(Map<String, dynamic> item, int openingBal){

    this.id = item['id'].toInt();
    this.no = item['no'];
    this.name = item['name'];
    this.uom = item['uom'];
    this.price =  double.tryParse(item['price']);
    this.outstandingBal = double.tryParse(item['outstandingBal']);
    this.openingBal = openingBal;
    this.path = item['path'];
  }

}

class ItemEmptyBalance{

  int outstandingBal;
  String lastReceiptNo;
  String itemName;
  String itemNo;
  String path;

  ItemEmptyBalance(this.outstandingBal, this.lastReceiptNo,this.itemName, this.path);

  ItemEmptyBalance.fromJson(Map<String, dynamic> item, int totRemaining, String lastReceiptNo){

    this.outstandingBal = totRemaining;
    this.lastReceiptNo = lastReceiptNo;
    this.itemNo = item['no'];
    this.itemName = item['name'];
    this.path = item['path'];

  }

}