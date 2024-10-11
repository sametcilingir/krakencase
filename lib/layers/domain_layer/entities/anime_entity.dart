import 'package:equatable/equatable.dart';

import '../../data_layer/models/anime_model.dart';
import 'character_entity.dart';

class AnimeEntity extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final num? score;
  final int? episodes;
  final String? synopsis;
  final List<String>? genres;
  final List<CharacterEntity>? characters;

  const AnimeEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.score,
    this.episodes,
    this.synopsis,
    this.genres,
    this.characters = const [],
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        score,
        episodes,
        synopsis,
        genres,
        characters,
      ];

  AnimeEntity copyWith({
    int? id,
    String? title,
    String? imageUrl,
    double? score,
    int? episodes,
    String? synopsis,
    List<String>? genres,
    List<CharacterEntity>? characters,
  }) {
    return AnimeEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      score: score ?? this.score,
      episodes: episodes ?? this.episodes,
      synopsis: synopsis ?? this.synopsis,
      genres: genres ?? this.genres,
      characters: characters ?? this.characters,
    );
  }

  factory AnimeEntity.fromModel(AnimeModel model) {
    return AnimeEntity(
      id: model.data!.malId,
      title: model.data!.title,
      imageUrl: model.data!.images['jpg']?.imageUrl ?? '',
      score: model.data!.score,
      episodes: model.data!.episodes,
      synopsis: model.data!.synopsis,
      genres: model.data!.genres?.map((e) => e.name ?? 'Unknown').toList(),
      characters: const [],
    );
  }

  factory AnimeEntity.fromAnimeDataModel(AnimeDataModel model) {
    return AnimeEntity(
      id: model.malId,
      title: model.title,
      imageUrl: model.images['jpg']?.imageUrl ?? '',
      score: model.score,
      episodes: model.episodes,
      synopsis: model.synopsis,
      genres: model.genres?.map((e) => e.name ?? 'Unknown').toList(),
      characters: const [],
    );
  }
}
