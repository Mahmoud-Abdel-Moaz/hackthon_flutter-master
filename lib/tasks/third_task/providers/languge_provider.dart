import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  bool isEn = true;

  Map<String, String> textsAr = {
    "popular": "رائج",
    "top_rated": "الأعلى تقييم",
    "favourite": "المفضل",
  };
  Map<String, String> textsEn = {
    "popular": "Popular",
    "top_rated": "Top Rated",
    "favourite": "Favourites",
  };


  changeLan(bool lan) async{
    isEn = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn", isEn);
  }

  getLan() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn = prefs.getBool("isEn")?? true;
    notifyListeners();
  }

  String? getTexts(String txt) {
    if (isEn == true) return textsEn[txt];
    return textsAr[txt];
  }
}
