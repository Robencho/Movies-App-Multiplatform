import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/domain/entities/actor.dart';

part 'actor_model.g.dart';

@JsonSerializable()
class ActorModel {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'character')
  final String character;
  @JsonKey(name: 'profile_path') 
  final String profilePath;

  ActorModel({
    required this.name,
    required this.character,
    required this.profilePath,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) => _$ActorModelFromJson(json);

  Actor toEntity() => Actor(
    name: name,
    character: character,
    profilePath: profilePath.isNotEmpty 
      ? 'https://image.tmdb.org/t/p/w500$profilePath'
      : 'assets/no_image.jpg',
  );
}