import 'package:either_dart/either.dart';
import '../../../entities/anime_entity.dart';

abstract class AnimeRepositoryBase {
  Future<Either<Exception, List<AnimeEntity>>> getTopAnime(
    int page, {
    String? type,
    String? filter,
  });
  Future<Either<Exception, AnimeEntity>> getAnimeDetail(int id);
}
