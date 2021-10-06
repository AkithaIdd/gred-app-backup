import 'package:gerd/service/register_service.dart';

class ResponseModel{
   int status;
   String message;



  ResponseModel(this.status, this.message);

  ResponseModel.fromJson(Map<String, dynamic> json){
    this.status = json['status'];
    this.message = json['message'];



    // RegisterService(status: status);

    // print(error);

  }
}