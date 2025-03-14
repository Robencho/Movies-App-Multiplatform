import 'package:movies_app/domain/entities/new_movie/movie.dart';

abstract class MovieUsecase {
  Future<List<Movie>> execute({int page = 1});
}