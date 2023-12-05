class RecitationsModel {
  RecitationsModel({
    required this.recitations,
  });
  late final List<Recitations> recitations;

  RecitationsModel.fromJson(Map<String, dynamic> json){
    recitations = List.from(json['recitations']).map((e)=>Recitations.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['recitations'] = recitations.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Recitations {
  Recitations({
    required this.id,
    required this.reciterName,
    this.style,
    required this.translatedName,
  });
  late final int id;
  late final String reciterName;
  late final String? style;
  late final TranslatedName translatedName;

  Recitations.fromJson(Map<String, dynamic> json){
    id = json['id'];
    reciterName = json['reciter_name'];
    style = null;
    translatedName = TranslatedName.fromJson(json['translated_name']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['reciter_name'] = reciterName;
    _data['style'] = style;
    _data['translated_name'] = translatedName.toJson();
    return _data;
  }
}

class TranslatedName {
  TranslatedName({
    required this.name,
    required this.languageName,
  });
  late final String name;
  late final String languageName;

  TranslatedName.fromJson(Map<String, dynamic> json){
    name = json['name'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['language_name'] = languageName;
    return _data;
  }
}