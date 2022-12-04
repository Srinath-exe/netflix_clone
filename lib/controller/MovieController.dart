import 'dart:developer';

import 'package:get/get.dart';
import 'package:netflix_clone/models/MovieDetailsModel.dart';
import 'package:netflix_clone/models/MoviesModel.dart';
import 'package:netflix_clone/repository/MovieDetailRepo.dart';
import 'package:netflix_clone/repository/MovieRepo.dart';

class MovieController extends GetxController {
  var isLoading = false.obs;
  var isSearch = false.obs;
  var noSearchresult = false.obs;
  var isMovieDetailLoading = false.obs;
  final movieDetail = Rxn<MoviesDetailsModel>();
  var mainMovieList = <MoviesModel>[].obs;
  var topMoviesList = <MoviesModel>[].obs;

  var popularmoviesList = <MoviesModel>[].obs;
  var theaterMoviesList = <MoviesModel>[].obs;
  var upcomingmoviesList = <MoviesModel>[].obs;
  var page = 20.obs;
  MovieRepository movieRepo = MovieRepository();

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void getMovieDetails(String id) async {
    movieDetail.value = null;
    isMovieDetailLoading.value = true;

    movieDetail.value =
        await MovieDetailRepository().getMovieDetails(movie_id: id);
    isMovieDetailLoading.value = false;
  }

  void fetchMovies() async {
    isLoading.value = true;
    isSearch.value = false;
    var movies = await movieRepo.getTopRatesMovie();
    if (movies != []) {
      mainMovieList.value = movies;
      topMoviesList.value = movies;

      isLoading.value = false;
    }
    log("getTopRatesMovie");

    popularmoviesList.value = await movieRepo.getPopularMovie();
    theaterMoviesList.value = await movieRepo.getNowplayingMovie();
    upcomingmoviesList.value = await movieRepo.getUpcomingMovie();
    log("FETCH COMPLETE");
    isLoading.value = false;
  }

  void showTopRelated(int id) {
    noSearchresult.value = false;
    isLoading.value = true;
    switch (id) {
      case 0:
        mainMovieList.value = topMoviesList;
        break;
      case 1:
        mainMovieList.value = popularmoviesList;
        break;
      case 2:
        mainMovieList.value = theaterMoviesList;
        break;
      case 3:
        mainMovieList.value = upcomingmoviesList;
        break;
      default:
        mainMovieList.value = topMoviesList;
        break;
    }
    isLoading.value = false;
  }

  void fetchTopRated() async {
    var movies = await movieRepo.getTopRatesMovie();
    log(movies.toString());
  }

  void searchMovies({required String query}) async {
    isLoading.value = true;
    noSearchresult.value = false;
    if (query == "") {
      isSearch.value = false;
      mainMovieList.value = topMoviesList;
    } else {
      isSearch.value = true;

      var searchmovies =
          await MovieDetailRepository().searchMovie(search: query);
      log(searchmovies.toString());
      if (searchmovies != []) {
        mainMovieList.value = searchmovies;
        isLoading.value = false;
        isSearch.value = false;
      }
    }
  }

  void retryMovie() async {
    isLoading.value = true;
    if (topMoviesList.isEmpty) {
      topMoviesList.value = await movieRepo.getTopRatesMovie();
      log("topMoviesList");
    }
    if (popularmoviesList.isEmpty) {
      popularmoviesList.value = await movieRepo.getPopularMovie();

      log("popularmoviesList");
    }
    if (theaterMoviesList.isEmpty) {
      theaterMoviesList.value = await movieRepo.getNowplayingMovie();

      log("theaterMoviesList");
    }
    if (upcomingmoviesList.isEmpty) {
      upcomingmoviesList.value = await movieRepo.getUpcomingMovie();
      log("upcomingmoviesList");
    }

    isLoading.value = false;
  }
}
