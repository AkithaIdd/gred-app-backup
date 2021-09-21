class ItemCategoryResponse {
  final List<ItemCategory> itemCategoryList;
  final List<ItemCategory> itemSubCatList;

  ItemCategoryResponse({this.itemCategoryList,this.itemSubCatList});

  factory ItemCategoryResponse.fromJson(Map<String, dynamic> item){
    var mainList =  <ItemCategory>[];
    var subList =  <ItemCategory>[];
    mainList.add(ItemCategory("Select Category", "Select Category"));
    subList.add(ItemCategory("Select Sub Category", "Select Sub Category"));
    for (var item in item['value']){
      if(item['indentation'].toInt() == 0){
        var itemSet = ItemCategory(item['code'], item['description']);
        mainList.add(itemSet);
      }else{
        var itemSet = ItemCategory(item['code'], item['description']);
        subList.add(itemSet);
      }

    }

    return ItemCategoryResponse(itemCategoryList: mainList,itemSubCatList: subList);
  }
}

class ItemCategory {
  final String code;
  final String description;

  ItemCategory(this.code, this.description);

}