import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/controller/MovieController.dart';
import 'package:netflix_clone/models/MovieDetailsModel.dart';
import 'package:netflix_clone/models/MoviesModel.dart';
import 'package:netflix_clone/repository/Repository..dart';

class MovieDetailRepository {
  final MovieController controller = Get.find();
  Future<MoviesDetailsModel?> getMovieDetails(
      {required String movie_id}) async {
    try {
      final response = await API.get(
          url:
              'https://api.themoviedb.org/3/movie/${movie_id}?api_key=${movieAPIKEY}');
      log("Movie Detail Status : ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var movieDetails = moviesDetailsModelFromJson(response.body);
        log(movieDetails.toString());
        return movieDetails;
      } else {
        return null;
      }
    } catch (e) {
      log("Movie Detail ERROR : $e");
      log("2nd req sent");
      if (e.toString() == "Connection reset by peer") {
        controller.getMovieDetails(movie_id);
      }
      return null;
    }
  }

  Future<List<MoviesModel>> searchMovie({required String search}) async {
    try {
      controller.noSearchresult.value = false;
      search = search.replaceAll(" ", "%20");

      final response = await API.get(
          url:
              'https://api.themoviedb.org/3/search/multi?api_key=${movieAPIKEY}&language=en-US&query=${search}&page=1&include_adult=false');
      var res = json.decode(response.body);
      if (res["results"] == null) {
        return [];
      }
      List<MoviesModel> lis = [];
      for (int i = 0; i < 20; i++) {
        if (res["results"][i]["media_type"] == "movie" &&
            res["results"][i]["poster_path"] != null) {
          lis.add(MoviesModel.fromJson(res["results"][i]));
        }
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return lis;
      } else {
        return [];
      }
    } catch (e) {
      log("CATCH EXCETURDED $e");
      if (e.toString().contains("RangeError")) {
        controller.noSearchresult.value = true;
      }
      if (e.toString() == "Connection reset by peer") {
        controller.searchMovies(query: search);
      }
      // if (e.toString().contains("FormatException")) {
      //   return lis;
      // }
      return [];
    }
  }
}