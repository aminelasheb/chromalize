import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as dio;

class sendAndreceive extends ChangeNotifier {

  bool pic_is_changing = false ;
  late String selectedImage = "";
  late File imageFile;





  Future<String> sendIt() async {
    try {
      FormData formData = new FormData.fromMap(
           {
        "image": await dio.MultipartFile.fromFile(selectedImage)
      });
      dio.Response response = await Dio().post('http://34.130.14.210:8080/core/colorize',
          data: formData,
          options: dio.Options(
              headers: <String, String>{}));
      print(response.statusCode.toString());
      print(response.data.toString()) ;

      return response.data['url'] ;
      print(response.data.toString()) ;
      print("succes ");
      pic_is_changing = false;
      selectedImage = "";
    } on DioError catch (e) {

      return "error" ;
      print("fail : ${e.response} ");
    }
  }

}