import 'package:flutter/material.dart';
import 'package:quotes_app/home/model/RandomQuoteList.dart';

class AppState with ChangeNotifier {
  int currentIndex = 0;
  bool showUnswipe = false;
  void changeUnswipeVisability({bool show = true}){
    showUnswipe = show;
    notifyListeners();
  }
  List<QuoteData> quoteList = [];
  void notify(){
    notifyListeners();
  }

}