import '../../../../models/anime_model.dart';
import '../../../../models/character_model.dart';

abstract class AnimeRemoteServiceBase {
  Future<TopAnimeModel> getTopAnime(
    int page, {
    String? type,
    String? filter,
  });
  Future<AnimeModel> getAnimeDetail(int id);
  Future<CharacterModel> getAnimeCharacters(int id);
}
