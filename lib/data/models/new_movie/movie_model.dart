// data/models/movie_model.dart
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/new_movie/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int id;
  final String title;
  final String overview;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

   // Método para convertir Modelo a Entidad (¡Esto faltaba!)
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
    );
  }
}