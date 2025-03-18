import 'package:movies_app/domain/repositories/movie_repositorie.dart';

import '../entities/movie.dart';

class GetMovieByIdUseCase{
  final MovieRepository repository;

  GetMovieByIdUseCase(this.repository);

  Future<Movie> execute(String id) async {
    return await repository.getmoviebyId(id);
  }
}