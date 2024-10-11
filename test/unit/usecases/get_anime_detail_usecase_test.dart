import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/domain_layer/usecases/get_anime_detail_usecase.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockAnimeRepositoryBase mockRepository;
  late GetAnimeDetailUseCase getAnimeDetailUseCase;

  setUp(() {
    mockRepository = MockAnimeRepositoryBase();
    getAnimeDetailUseCase = GetAnimeDetailUseCase(mockRepository);
  });

  group('GetAnimeDetailUseCase', () {
    test('returns AnimeEntity on success', () async {
      const testAnime = AnimeEntity(
        id: 1,
        title: "Test Anime",
        imageUrl: "http://example.com/image.jpg",
        score: 8.5,
        episodes: 24,
        synopsis: "Test synopsis",
        genres: [],
      );

      when(mockRepository.getAnimeDetail(1)).thenAnswer((_) async => const Right(testAnime));

      final result = await getAnimeDetailUseCase(1);

      expect(result.isRight, true);
      expect(result.right, testAnime);
    });

    test('returns Left(Exception) on failure', () async {
      when(mockRepository.getAnimeDetail(1)).thenAnswer((_) async => Left(Exception('Failed to fetch')));

      final result = await getAnimeDetailUseCase(1);

      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });
  });
}
