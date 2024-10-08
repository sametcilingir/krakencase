import 'package:injectable/injectable.dart';
import 'package:either_dart/either.dart';
import '../entities/anime_entity.dart';
import '../repositories/anime/base/anime_repository_base.dart';

@lazySingleton
class GetTopAnimeUseCase {
  final AnimeRepositoryBase repository;

  GetTopAnimeUseCase(this.repository);

  Future<Either<Exception, List<AnimeEntity>>> call(
    int page, {
    String? type,
    String? filter,
  }) {
    return repository.getTopAnime(page, type: type, filter: filter);
  }
}
