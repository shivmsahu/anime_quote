import 'package:dio/dio.dart';
import 'package:quotes_app/home/model/random_anime_quote_list.dart';

class HomeController{
  static Future<List<RandomAnimeQuoteList>> getRandomQuotes() async {
    var response = await Dio().get('https://animechan.vercel.app/api/quotes');
    if(response.statusCode == 200){
      List<RandomAnimeQuoteList> res = [];
      var list = response.data as List;
      for(var i in list){
        res.add(RandomAnimeQuoteList.fromJson(i));
      }
      return res;
    }
    return [];
  }
}