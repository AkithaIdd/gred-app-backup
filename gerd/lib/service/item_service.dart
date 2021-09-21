
import 'dart:convert';

import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/item_category.dart';
import 'package:gerd/model/item_item.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:ntlm/ntlm.dart';

import 'package:http/http.dart' as http;

class ItemService{


  NTLMClient client = new NTLMClient(
      username: "mobAdmin",
      password: "admin@Mob",
      domain: "dynslnbc");

  //get item list
  Future<APIResponse<ItemResponse>> getItemList(String request,String query){

    return  client.get(Uri.parse(API_BASE_URL+SERVER_ENDPOINT+companies+request+items+query))
        .then((data) {
      if(data.statusCode == 200){
        final jasonData = json.decode(data.body);

        return APIResponse<ItemResponse>(data: ItemResponse.fromJson(jasonData));
      }

      return APIResponse<ItemResponse>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<ItemResponse>(error: true,errorMessage: 'An error occured'));
  }

  //item category list
  Future<APIResponse<ItemCategoryResponse>> getCategoryList(String request){

    return  client.get(Uri.parse(API_BASE_URL+SERVER_ENDPOINT+companies+request+itemCategories))
        .then((data) {
      if(data.statusCode == 200){
        final jasonData = json.decode(data.body);

        return APIResponse<ItemCategoryResponse>(data: ItemCategoryResponse.fromJson(jasonData));
      }

      return APIResponse<ItemCategoryResponse>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<ItemCategoryResponse>(error: true,errorMessage: 'An error occured'));
  }


}

