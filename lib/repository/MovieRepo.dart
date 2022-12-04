import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/controller/MovieController.dart';
import 'package:netflix_clone/models/MoviesModel.dart';
import 'package:netflix_clone/repository/Repository..dart';

class MovieRepository {
  Future<List<MoviesModel>> getTopRatesMovie() async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/top_rated?api_key=${movieAPIKEY}');

    if (response != null) {
      var res = json.decode(response.body);
      var resp = json.encode(res["results"]);
      var movieList = moviesModelFromJson(resp);
      return movieList;
    } else {
      return [];
    }
  }

  Future<List<MoviesModel>> getNowplayingMovie() async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/now_playing?api_key=${movieAPIKEY}');

    if (response != null) {
      var res = json.decode(response.body);
      // log(res["results"].toString());
      var resp = json.encode(res["results"]);
      var movieList = moviesModelFromJson(resp);
      log(movieList.toString());
      return movieList;
    } else {
      return [];
    }
  }

  Future<List<MoviesModel>> getUpcomingMovie() async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/upcoming?api_key=${movieAPIKEY}');

    if (response != null) {
      var res = json.decode(response.body);
      var resp = json.encode(res["results"]);
      var movieList = moviesModelFromJson(resp);
      return movieList;
    } else {
      return [];
    }
  }

  Future<List<MoviesModel>> getPopularMovie() async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/popular?api_key=${movieAPIKEY}');

    if (response != null) {
      var res = json.decode(response.body);
      // log(res["results"].toString());
      var resp = json.encode(res["results"]);
      var movieList = moviesModelFromJson(resp);
      return movieList;
    }
    return [];
  }

  Future<List<MoviesModel>> getSimilarMovie({required String movie_id}) async {
    final response = await API.get(
      url:
          'https://api.themoviedb.org/3/movie/${movie_id}/similar?api_key=${movieAPIKEY}',
    );

    if (response != null) {
      var res = json.decode(response.body);
      // log(res["results"].toString());
      var resp = json.encode(res["results"]);
      var movieList = moviesModelFromJson(resp);
      return movieList;
    } else {
      return [];
    }
  }
}
