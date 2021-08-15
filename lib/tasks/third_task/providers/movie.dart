import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Movie with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  bool isFavorite;

  Movie(
      {required this.id,
      required this.title,
      required this.imageUrl,
      this.isFavorite = false});

  void _setFavValue(bool newValue){
    isFavorite=newValue;
    notifyListeners();
  }
  Future<void> toggleFavoriteStatus()async{

  }


}
