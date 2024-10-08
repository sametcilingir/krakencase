import 'package:injectable/injectable.dart';
import 'package:either_dart/either.dart';
import '../entities/anime_entity.dart';
import '../repositories/anime/base/anime_repository_base.dart';

@lazySingleton
class GetAnimeDetailUseCase {
  final AnimeRepositoryBase repository;

  GetAnimeDetailUseCase(this.repository);

  Future<Either<Exception, AnimeEntity>> call(int id) {
    return repository.getAnimeDetail(id);
  }
}
