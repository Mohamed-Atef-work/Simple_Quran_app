class SourahVersesModel {
  late final List<Verses> verses;
  late final Pagination pagination;

  SourahVersesModel.fromJson(Map<String, dynamic> json){
    verses = List.from(json['verses']).map((e)=>Verses.fromJson(e)).toList();
    pagination = Pagination.fromJson(json['pagination']);
  }


}

class Verses {

  late final int id;
  late final int verseNumber;
  late final int chapterId;
  late final String verseKey;
  late final String textIndopak;
  late final int juzNumber;
  late final int hizbNumber;
  late final int rubElHizbNumber;
  late final Null sajdahNumber;
  late final int pageNumber;
  late final Null sajdah;
  late final String textMadani;
  late final List<Words> words;

  Verses.fromJson(Map<String, dynamic> json){
    id = json['id'];
    verseNumber = json['verse_number'];
    chapterId = json['chapter_id'];
    verseKey = json['verse_key'];
    textIndopak = json['text_indopak'];
    juzNumber = json['juz_number'];
    hizbNumber = json['hizb_number'];
    rubElHizbNumber = json['rub_el_hizb_number'];
    sajdahNumber = null;
    pageNumber = json['page_number'];
    sajdah = null;
    textMadani = json['text_madani'];
    words = List.from(json['words']).map((e)=>Words.fromJson(e)).toList();
  }


}

class Words {

  late final int id;
  late final int position;
  late final String textIndopak;
  late final String verseKey;
  late final int lineNumber;
  late final int pageNumber;
  late final String code;
  late final String className;
  late final String textMadani;
  late final String charType;
  late final Transliteration transliteration;
  late final Translation translation;
  late final Audio audio;

  Words.fromJson(Map<String, dynamic> json){
    id = json['id'];
    position = json['position'];
    textIndopak = json['text_indopak'];
    verseKey = json['verse_key'];
    lineNumber = json['line_number'];
    pageNumber = json['page_number'];
    code = json['code'];
    className = json['class_name'];
    textMadani = json['text_madani'];
    charType = json['char_type'];
    transliteration = Transliteration.fromJson(json['transliteration']);
    translation = Translation.fromJson(json['translation']);
    audio = Audio.fromJson(json['audio']);
  }


}

class Transliteration {

  late final String? text;
  late final String languageName;

  Transliteration.fromJson(Map<String, dynamic> json){
    text = null;
    languageName = json['language_name'];
  }


}

class Translation {

  late final String languageName;
  late final String text;

  Translation.fromJson(Map<String, dynamic> json){
    languageName = json['language_name'];
    text = json['text'];
  }


}

class Audio {

  late final String? url;

  Audio.fromJson(Map<String, dynamic> json){
    url = null;
  }


}

class Pagination {

  late final int currentPage;
  late final Null nextPage;
  late final Null prevPage;
  late final int totalPages;
  late final int totalCount;

  Pagination.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    nextPage = null;
    prevPage = null;
    totalPages = json['total_pages'];
    totalCount = json['total_count'];
  }

}