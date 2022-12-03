import 'package:netflix_clone/models/MovieDetailsModel.dart';
import 'package:netflix_clone/models/MoviesModel.dart';

List<MoviesModel> newList = [
  MoviesModel.fromJson(
    {
      "adult": false,
      "backdrop_path": "/rl7Jw8PjhSIjArOlDNv0JQPL1ZV.jpg",
      "genre_ids": [10749, 18],
      "id": 851644,
      "original_language": "ko",
      "original_title": "20세기 소녀",
      "overview":
          "Yeon-du asks her best friend Bora to collect all the information she can about Baek Hyun-jin while she is away in the U.S. for heart surgery. Bora decides to get close to Baek's best friend, Pung Woon-ho first. However, Bora's clumsy plan unfolds in an unexpected direction. In 1999, a year before the new century, Bora, who turns seventeen, falls into the fever of first love.",
      "popularity": 317.634,
      "poster_path": "/od22ftNnyag0TTxcnJhlsu3aLoU.jpg",
      "release_date": "2022-10-06",
      "title": "20th Century Girl",
      "video": false,
      "vote_average": 8.8,
      "vote_count": 276
    },
  ),
  MoviesModel.fromJson(
    {
      "adult": false,
      "backdrop_path": "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
      "genre_ids": [18, 80],
      "id": 238,
      "original_language": "en",
      "original_title": "The Godfather",
      "overview":
          "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
      "popularity": 104.118,
      "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
      "release_date": "1972-03-14",
      "title": "The Godfather",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 16947
    },
  ),
  MoviesModel.fromJson(
    {
      "adult": false,
      "backdrop_path": "/rl7Jw8PjhSIjArOlDNv0JQPL1ZV.jpg",
      "genre_ids": [10749, 18],
      "id": 851644,
      "original_language": "ko",
      "original_title": "20세기 소녀",
      "overview":
          "Yeon-du asks her best friend Bora to collect all the information she can about Baek Hyun-jin while she is away in the U.S. for heart surgery. Bora decides to get close to Baek's best friend, Pung Woon-ho first. However, Bora's clumsy plan unfolds in an unexpected direction. In 1999, a year before the new century, Bora, who turns seventeen, falls into the fever of first love.",
      "popularity": 317.634,
      "poster_path": "/od22ftNnyag0TTxcnJhlsu3aLoU.jpg",
      "release_date": "2022-10-06",
      "title": "20th Century Girl",
      "video": false,
      "vote_average": 8.8,
      "vote_count": 276
    },
  ),
  MoviesModel.fromJson(
    {
      "adult": false,
      "backdrop_path": "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
      "genre_ids": [18, 80],
      "id": 238,
      "original_language": "en",
      "original_title": "The Godfather",
      "overview":
          "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
      "popularity": 104.118,
      "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
      "release_date": "1972-03-14",
      "title": "The Godfather",
      "video": false,
      "vote_average": 4.9,
      "vote_count": 16947
    },
  ),
  MoviesModel.fromJson(
    {
      "adult": false,
      "backdrop_path": "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
      "genre_ids": [18, 80],
      "id": 278,
      "original_language": "en",
      "original_title": "The Shawshank Redemption",
      "overview":
          "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      "popularity": 81.862,
      "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
      "release_date": "1994-09-23",
      "title": "The Shawshank Redemption",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 22704
    },
  ),
  MoviesModel.fromJson(
    {
      "adult": false,
      "backdrop_path": "/kGzFbGhp99zva6oZODW5atUtnqi.jpg",
      "genre_ids": [18, 80],
      "id": 240,
      "original_language": "en",
      "original_title": "The Godfather Part II",
      "overview":
          "In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.",
      "popularity": 58.857,
      "poster_path": "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
      "release_date": "1974-12-20",
      "title": "The Godfather Part II",
      "video": false,
      "vote_average": 8.6,
      "vote_count": 10275
    },
  ),
];

var moviedetail = MoviesDetailsModel.fromJson({
  "adult": false,
  "backdrop_path": "/rl7Jw8PjhSIjArOlDNv0JQPL1ZV.jpg",
  "belongs_to_collection": null,
  "budget": 121000000,
  "genres": [
    {"id": 10749, "name": "Romance"},
    {"id": 18, "name": "Drama"}
  ],
  "homepage": "",
  "id": 851644,
  "imdb_id": "tt15340724",
  "original_language": "ko",
  "original_title": "20세기 소녀",
  "overview":
      "Yeon-du asks her best friend Bora to collect all the information she can about Baek Hyun-jin while she is away in the U.S. for heart surgery. Bora decides to get close to Baek's best friend, Pung Woon-ho first. However, Bora's clumsy plan unfolds in an unexpected direction. In 1999, a year before the new century, Bora, who turns seventeen, falls into the fever of first love.",
  "popularity": 297.619,
  "poster_path": "/od22ftNnyag0TTxcnJhlsu3aLoU.jpg",
  "production_companies": [
    {
      "id": 49096,
      "logo_path": "/dj9VQ8Tqw4OTP8h5JkSOQGpEeMR.png",
      "name": "Yong Film",
      "origin_country": "KR"
    }
  ],
  "production_countries": [
    {"iso_3166_1": "KR", "name": "South Korea"}
  ],
  "release_date": "2022-10-06",
  "revenue": 0,
  "runtime": 119,
  "spoken_languages": [
    {"english_name": "Korean", "iso_639_1": "ko", "name": "한국어/조선말"}
  ],
  "status": "Released",
  "tagline": "A first love pov story.",
  "title": "20th Century Girl",
  "video": false,
  "vote_average": 8.725,
  "vote_count": 282
});
