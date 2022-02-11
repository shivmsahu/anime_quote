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
  List<String> _quoteList = [
    'assets/humaaans_2.jpg',
    'assets/humaaans_3.jpg',
    'assets/humaaans_6.jpg',
    'assets/humaaans_5.jpg',
    'assets/humaaans_8.jpg',
    'assets/humaaans_10.jpg',
    'assets/humaaans_11.jpg',
    'assets/humaaans_3.jpg',
    'assets/humaaans_6.jpg',
    'assets/humaaans_5.jpg',
    'assets/humaaans_8.jpg',
    'assets/humaaans_10.jpg',
    'assets/humaaans_11.jpg',
    'assets/humaaans_3.jpg',
    'assets/humaaans_6.jpg',
    'assets/humaaans_5.jpg',
    'assets/humaaans_8.jpg',
    'assets/humaaans_10.jpg',
    'assets/humaaans_11.jpg',
    'assets/humaaans_3.jpg',
    'assets/humaaans_6.jpg',
    'assets/humaaans_5.jpg',
    'assets/humaaans_8.jpg',
    'assets/humaaans_10.jpg',
    'assets/humaaans_11.jpg',
    'assets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpg',
    'assets/humaaans_12.jpg',
    'assets/humaaans_1.jpg',
  ];

}