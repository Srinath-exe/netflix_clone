import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/models/MoviesModel.dart';
import 'package:netflix_clone/repository/Repository..dart';

class MovieRepository {
  // final MovieController controller = Get.put(MovieController());

  Future<List<MoviesModel>> getTopRatesMovie() async {
    try {
      final response = await API.get(
          url:
              'https://api.themoviedb.org/3/movie/top_rated?api_key=${movieAPIKEY}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = json.decode(response.body);
        var resp = json.encode(res["results"]);
        var movieList = moviesModelFromJson(resp);
        return movieList;
      } else {
        return [];
      }
    } catch (e) {
      log("getTopRatesMovie error : $e");
      if (e.toString() == "Connection reset by peer") {}
      return [];
    }
  }

  Future<List<MoviesModel>> getNowplayingMovie() async {
    try {
      final response = await API.get(
          url:
              'https://api.themoviedb.org/3/movie/now_playing?api_key=${movieAPIKEY}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = json.decode(response.body);
        // log(res["results"].toString());
        var resp = json.encode(res["results"]);
        var movieList = moviesModelFromJson(resp);
        log(movieList.toString());
        return movieList;
      } else {
        return [];
      }
    } catch (e) {
      log("now_playing error : $e");
      return [];
    }
  }

  Future<List<MoviesModel>> getUpcomingMovie() async {
    try {
      final response = await API.get(
          url:
              'https://api.themoviedb.org/3/movie/upcoming?api_key=${movieAPIKEY}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = json.decode(response.body);
        var resp = json.encode(res["results"]);
        var movieList = moviesModelFromJson(resp);
        return movieList;
      } else {
        return [];
      }
    } catch (e) {
      log("upcoming error : $e");
      // controller.upcomingmoviesList.value =
      //     await MovieRepository().getUpcomingMovie();

      return [];
    }
  }

  Future<List<MoviesModel>> getPopularMovie() async {
    try {
      final response = await API.get(
          url:
              'https://api.themoviedb.org/3/movie/popular?api_key=${movieAPIKEY}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = json.decode(response.body);
        // log(res["results"].toString());
        var resp = json.encode(res["results"]);
        var movieList = moviesModelFromJson(resp);
        return movieList;
      } else {
        return [];
      }
    } catch (e) {
      log("popular error : $e");
      // controller.popularmoviesList.value =
      //     await MovieRepository().getPopularMovie();
      return [];
    }
  }

  Future<List<MoviesModel>> getSimilarMovie({required String movie_id}) async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/${movie_id}/similar?api_key=${movieAPIKEY}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = json.decode(response.body);
      // log(res["results"].toString());
      var resp = json.encode(res["results"]);
      var movieList = moviesModelFromJson(resp);
      return movieList;
    } else {
      return [];
    }
  }

// sfadddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

  // Future<List<MovieModel>> searchMovie({required String search}) async {
  //   final response = await API.get(
  //       url:
  //           'https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=${search}&api-key=${APIKEY}');
  //   var res = json.decode(response.body);
  //   if (res["results"] == null) {
  //     return [];
  //   }
  //   List<MovieModel> lis = [];
  //   List.generate(
  //       res["num_results"],
  //       (index) => {
  //             if (res["results"][index]["multimedia"] != null)
  //               {lis.add(MovieModel.fromJson(res["results"][index]))}
  //           });

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return lis;
  //   } else {
  //     return [];
  //   }
  // }
}
