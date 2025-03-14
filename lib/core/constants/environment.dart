import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment{
  static String theMovieDbKey = dotenv.env['THE_MOVIE_DB_KEY'] ?? 'NO HAY API KEY';
  static String baseUrl = "https://api.themoviedb.org/3";
  static String imagesBaseurl = "https://image.tmdb.org/t/p/w500";
  
}