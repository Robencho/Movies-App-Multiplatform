import 'package:movies_app/domain/repositories/new_repositorie/movie_repositorie.dart';

import '../entities/new_movie/movie.dart';

class GetMovieByIdUseCase{
  final MovieRepository repository;

  GetMovieByIdUseCase(this.repository);

  Future<Movie> execute(String id) async {
    return await repository.getmoviebyId(id);
  }
}