import '../../../../models/anime_model.dart';
import '../../../../models/character_model.dart';

abstract class AnimeRemoteServiceBase {
  Future<AnimeModel> getTopAnime(
    int page, {
    String? type,
    String? filter,
  });
  Future<DatumForAnime> getAnimeDetail(int id);
  Future<CharacterModel> getAnimeCharacters(int id);
}
