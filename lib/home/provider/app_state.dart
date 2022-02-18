import 'package:flutter/material.dart';
import 'package:quotes_app/home/model/random_anime_quote_list.dart';

class AppState with ChangeNotifier {
  int currentIndex = 0;
  bool showUnswipe = false;
  void changeUnswipeVisability({bool show = true}){
    showUnswipe = show;
    notifyListeners();
  }
  List<RandomAnimeQuoteList> quoteList = [];
  void notify(){
    notifyListeners();
  }

}