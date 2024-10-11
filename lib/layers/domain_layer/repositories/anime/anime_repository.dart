import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../application_layer/constants/string_constants.dart';
import '../../../data_layer/services/remote/anime/base/anime_remote_service_base.dart';
import '../../entities/anime_entity.dart';
import '../../entities/character_entity.dart';
import 'base/anime_repository_base.dart';

@LazySingleton(as: AnimeRepositoryBase)
class AnimeRepository implements AnimeRepositoryBase {
  final AnimeRemoteServiceBase remoteService;

  AnimeRepository({required this.remoteService});

  @override
  Future<Either<Exception, List<AnimeEntity>>> getTopAnime(
    int page, {
    String? type,
    String? filter,
  }) async {
    try {
      final result = await remoteService.getTopAnime(page, type: type, filter: filter);
      final data = result.data;
      if (data != null) {
        final list = data.map((e) => AnimeEntity.fromAnimeDataModel(e)).toList();
        return Right(list);
      } else {
        return Left(Exception(StringConstants.noAnimeFoundText));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, AnimeEntity>> getAnimeDetail(int id) async {
    try {
      final data = await remoteService.getAnimeDetail(id);
      var animeEntity = AnimeEntity.fromModel(data);
      final characterResult = await remoteService.getAnimeCharacters(id);
      final characterData = characterResult.data;
      if (characterData != null) {
        animeEntity = animeEntity.copyWith(
          characters: characterData.map((e) => CharacterEntity.fromCharacterDataModel(e)).toList(),
        );
      }
      return Right(animeEntity);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
