import 'dart:convert';
/// anime : "Soul Eater"
/// character : "Medusa Gorgon"
/// quote : "Um well Miss Maka? Can you do me a favor and help me out with your father? I can't get him off my leg."

RandomAnimeQuoteList randomAnimeQuoteListFromJson(String str) => RandomAnimeQuoteList.fromJson(json.decode(str));
String randomAnimeQuoteListToJson(RandomAnimeQuoteList data) => json.encode(data.toJson());
class RandomAnimeQuoteList {
  RandomAnimeQuoteList({
      String? anime, 
      String? character, 
      String? quote,}){
    _anime = anime;
    _character = character;
    _quote = quote;
}

  RandomAnimeQuoteList.fromJson(Map<String,dynamic> json) {
    _anime = json['anime'];
    _character = json['character'];
    _quote = json['quote'];
  }
  String? _anime;
  String? _character;
  String? _quote;

  String? get anime => _anime;
  String? get character => _character;
  String? get quote => _quote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['anime'] = _anime;
    map['character'] = _character;
    map['quote'] = _quote;
    return map;
  }

}