import 'package:dio/dio.dart';
import 'package:quotes_app/home/model/RandomQuoteList.dart';

class HomeController{
  static Future<RandomQuoteList> getRandomQuotes() async {
    var response = await Dio().get('https://quote-garden.herokuapp.com/api/v3/quotes/random?count=10');
    if(response.statusCode == 200){
      return RandomQuoteList.fromJson(response.data);
    }
    return RandomQuoteList();
  }
}