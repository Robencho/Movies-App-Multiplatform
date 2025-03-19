import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/usecases/movie_usecase.dart';

import '../repositories/movie_repositorie.dart';

class GetUpcomingMoviesUsecase implements MovieUsecase{
  final MovieRepository repository;

  GetUpcomingMoviesUsecase(this.repository);

  @override
  Future<({List<Movie>movies, int totalPages})> execute({int page = 1}) async {
    return await repository.getUpComing(page: page);
  }
}