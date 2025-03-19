import '../entities/actor.dart';
import '../repositories/movie_repositorie.dart';

class GetMovieCastUseCase {
  final MovieRepository repository;

  GetMovieCastUseCase(this.repository);

  Future<List<Actor>> execute(String movieId) async {
    return await repository.getMovieCast(movieId);
  }
}