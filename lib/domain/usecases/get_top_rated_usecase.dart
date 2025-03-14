import 'package:movies_app/domain/usecases/movie_usecase.dart';

import '../entities/new_movie/movie.dart';
import '../repositories/new_repositorie/movie_repositorie.dart';

class GetTopRatedUseCase implements MovieUsecase {
  final MovieRepository repository;

  GetTopRatedUseCase(this.repository);

  @override
  Future<({List<Movie>movies, int totalPages})> execute({int page = 1}) async {
    return await repository.getTopRated(page: page);
  }
}