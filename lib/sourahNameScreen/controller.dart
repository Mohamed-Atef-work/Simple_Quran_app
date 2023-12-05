
import 'package:dio/dio.dart';

import '../components/models/oneSourahDetailsModel.dart';

class SourahNamesController
{

  String selectedPlace = "both";
  List<String> places =["makkah","madinah","both"];
  bool isDeleted = false;

  String sourah = "";


  //List listSourahId = [];



  Future<SourahDetailsModel>getSourahDetails(String sourahId)
  async {
    var response = await Dio().get("https://api.quran.com/api/v3/chapters/$sourahId");
    Map<String, dynamic> apiMap  = response.data;
    return SourahDetailsModel.fromJson(apiMap);
    //print(model.title.toString());
  }

  // Future<SourahVersesModel>getSourahVerses()
  // async {
  //   var response = await Dio().get("https://api.quran.com/api/v3/chapters/1/verses?language=ar&text_type=words");
  //   Map<String, dynamic> apiMap  = response.data;
  //   return SourahVersesModel.fromJson(apiMap);
  //   //print(model.title.toString());
  // }


  // Future<RecitationsModel>getAllSourahNames()
  // async {
  //   var response = await Dio().get("https://api.quran.com/api/v4/resources/recitations?language=ar");
  //   Map<String, dynamic> apiMap  = response.data;
  //   return RecitationsModel.fromJson(apiMap);
  //   //print(model.title.toString());
  // }
}