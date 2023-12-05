import 'package:dio/dio.dart';
import '../components/models/oneSourahDetailsModel.dart';
import '../components/models/sourahVersesModel.dart';

class SourahController
{

  String sourah = "";


  List<String> names = [];


  Future<SourahDetailsModel>getSourahDetails(String sourahId)
  async {
    var response = await Dio().get("https://api.quran.com/api/v3/chapters/$sourahId");
    Map<String, dynamic> apiMap  = response.data;
    return SourahDetailsModel.fromJson(apiMap);
    //print(model.title.toString());
  }

  Future<SourahVersesModel>getSourahVerses(String sourahId)
  async {
    var response = await Dio().get("https://api.quran.com/api/v3/chapters/$sourahId/verses?language=ar&text_type=words");
    Map<String, dynamic> apiMap  = response.data;
    return SourahVersesModel.fromJson(apiMap);
    //print(model.title.toString());
  }




  // Future<RecitationsModel>getAllSourahNames()
  // async {
  //   var response = await Dio().get("https://api.quran.com/api/v4/resources/recitations?language=ar");
  //   Map<String, dynamic> apiMap  = response.data;
  //   return RecitationsModel.fromJson(apiMap);
  //   //print(model.title.toString());
  // }
}