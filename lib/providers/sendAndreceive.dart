import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as dio;

class sendAndreceive extends ChangeNotifier {

  bool pic_is_changing = false ;
  late String selectedImage = "";
  late File imageFile;


  Future<dynamic> sendIt() async {
    try {
      FormData formData = new FormData.fromMap(
           {
        "message":"hello world" ,
        "image": await dio.MultipartFile.fromFile(selectedImage)
      });
      dio.Response response = await Dio().post('link',
          data: formData,
          options: dio.Options(
              headers: <String, String>{'Authorization': 'Token xyz'}));
      print("succes ");
      pic_is_changing = false;
      selectedImage = "";
    } on DioError catch (e) {
      print("fail : ${e.response} ");
    }
  }

}