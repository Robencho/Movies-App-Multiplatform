import 'package:movies_app/domain/entities/movie.dart';

abstract class MovieUsecase {
  Future<({List<Movie>movies, int totalPages})> execute({int page = 1});
}