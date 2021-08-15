
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/models/responce.dart';
import 'package:hackathon_fatura/tasks/third_task/providers/movie.dart';
import 'package:hackathon_fatura/tasks/third_task/third_task_constants.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Movies with ChangeNotifier{
  List<Movie> _movies=[];
  List<Movie> favoritesMovies = [];
  List<String> prefMoviesId = [];
  List<Movie> get items {
    return [..._movies];
  }

  List<Movie> get favoritesItems {
    return _movies.where((element) => element.isFavorite).toList();
  }

  void toggleFavorite(String movieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final existingIndex =
    favoritesMovies.indexWhere((movie) => movie.id == movieId);

    if (existingIndex != -1) {
      favoritesMovies.removeAt(existingIndex);
      prefMoviesId.remove(movieId);
    } else {
      favoritesMovies.add(_movies.firstWhere((movie) => movieId == movie.id));
      prefMoviesId.add(movieId);
    }
    prefs.setStringList('prefMoviesId', prefMoviesId);
    notifyListeners();
  }

  bool isMealFavorite(String id) {
    return favoritesMovies.any((movie) => movie.id == id);
    notifyListeners();
  }

  Future<void> fetchAndSetMovies(int page) async {
   // var url ="https://api.themoviedb.org/3/discover/movie?api_key=a06a65f8e9b7f4e31d4cdee71b82fc83&sort_by=popularity.desc&page=1";
    var url =ThirdTaskConstants.BaseURL+ThirdTaskConstants.BaseAPIVersion+ThirdTaskConstants.MovieEndpoint+"?api_key="+ThirdTaskConstants.TheMovieDBAPIKey+"&sort_by="+MoviesSortBy.popularity.toString()+"&page=$page";
    try {
      print(url);
      final res = await http.get(url);
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefMoviesId = prefs.getStringList('prefMoviesId') ?? [];
      final favRes = await http.get(url);
      final Responce responce=Responce.fromJson(json.decode(favRes.body));
      final favData = json.decode(favRes.body);
      final List<Movie> loadedMovies = [];

      responce.results!.forEach((element) {
        print(element.title);
        loadedMovies.add(Movie(
          id: element.id.toString(),
          title: element.title,
          imageUrl: element.poster_path,
          isFavorite: favData == null ? false : favData[element.id] ?? false,
        ));
      });
      /*extractedData.forEach((prodId, prodData) {
        loadedMovies.add(Movie(
          id: prodData['id'],
          title: prodData['title'],
          imageUrl: prodData['imageUrl'],
          isFavorite: favData == null ? false : favData[prodId] ?? false,
        ));
      });*/
      _movies = loadedMovies;

      for (var movieId in prefMoviesId) {
        final existingIndex =
        favoritesMovies.indexWhere((movie) => movie.id == movieId);

        if (existingIndex < 0) {
          favoritesMovies.add(_movies.firstWhere((movie) => movieId == movie.id));
        }
      }
      List<Movie> fm=[];
      favoritesMovies.forEach((favMeal) {
        _movies.forEach((avMovie) {
          if(favMeal.id==avMovie.id&&!fm.contains(avMovie)){
            fm.add(avMovie);
          }
        });
      });
      favoritesMovies=fm;

      notifyListeners();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}