import 'package:injectable/injectable.dart';

import '../../../../application_layer/constants/string_constants.dart';
import '../../../models/anime_model.dart';
import '../../../models/character_model.dart';
import 'anime_api_service.dart';
import 'base/anime_remote_service_base.dart';

@LazySingleton(as: AnimeRemoteServiceBase)
class AnimeRemoteService implements AnimeRemoteServiceBase {
  final AnimeApiService apiService;

  AnimeRemoteService({required this.apiService});

  @override
  Future<TopAnimeModel> getTopAnime(
    int page, {
    String? type,
    String? filter,
  }) async {
    final response = await apiService.getTopAnime(
      page,
      type: type,
      filter: filter,
    );
    if (response.isSuccessful && response.body != null) {
      return TopAnimeModel.fromJson(response.body!);
    } else {
      throw Exception(
        '${StringConstants.failedToLoadTopAnime} : ${response.statusCode} ${response.error}',
      );
    }
  }

  @override
  Future<AnimeModel> getAnimeDetail(int id) async {
    final response = await apiService.getAnimeDetail(id);
    if (response.isSuccessful && response.body != null) {
      return AnimeModel.fromJson(response.body!);
    } else {
      throw Exception(
        '${StringConstants.failedToLoadAnimeDetail} : ${response.statusCode} ${response.error}',
      );
    }
  }

  @override
  Future<CharacterModel> getAnimeCharacters(int id) async {
    final response = await apiService.getAnimeCharacters(id);
    if (response.isSuccessful && response.body != null) {
      return CharacterModel.fromJson(response.body!);
    } else {
      throw Exception(
        '${StringConstants.failedToLoadAnimeCharacters} : ${response.statusCode} ${response.error}',
      );
    }
  }
}
