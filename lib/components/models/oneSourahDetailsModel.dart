class SourahDetailsModel {

  late final Chapter chapter;

  SourahDetailsModel.fromJson(Map<String, dynamic> json){
    chapter = Chapter.fromJson(json['chapter']);
  }


}

class Chapter {

  late final int id;
  late final String revelationPlace;
  late final int revelationOrder;
  late final bool bismillahPre;
  late final String nameSimple;
  late final String nameComplex;
  late final String nameArabic;
  late final int versesCount;
  late final List<int> pages;
  late final int chapterNumber;
  late final TranslatedName translatedName;

  Chapter.fromJson(Map<String, dynamic> json){
    id = json['id'];
    revelationPlace = json['revelation_place'];
    revelationOrder = json['revelation_order'];
    bismillahPre = json['bismillah_pre'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    versesCount = json['verses_count'];
    pages = List.castFrom<dynamic, int>(json['pages']);
    chapterNumber = json['chapter_number'];
    translatedName = TranslatedName.fromJson(json['translated_name']);
  }


}

class TranslatedName {
  TranslatedName({
    required this.languageName,
    required this.name,
  });
  late final String languageName;
  late final String name;

  TranslatedName.fromJson(Map<String, dynamic> json){
    languageName = json['language_name'];
    name = json['name'];
  }


}