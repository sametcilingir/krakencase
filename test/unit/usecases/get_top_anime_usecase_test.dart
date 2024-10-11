import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/domain_layer/usecases/get_top_anime_usecase.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockAnimeRepositoryBase mockRepository;
  late GetTopAnimeUseCase getTopAnimeUseCase;

  setUp(() {
    mockRepository = MockAnimeRepositoryBase();
    getTopAnimeUseCase = GetTopAnimeUseCase(mockRepository);
  });

  group('GetTopAnimeUseCase', () {
    test('returns list of AnimeEntity on success', () async {
      final testAnimes = [
        const AnimeEntity(
          id: 1,
          title: "Test Anime",
          imageUrl: "http://example.com/image.jpg",
          score: 8.5,
          episodes: 24,
          synopsis: "Test synopsis",
          genres: [],
        ),
      ];

      when(mockRepository.getTopAnime(1, type: null, filter: null)).thenAnswer((_) async => Right(testAnimes));

      final result = await getTopAnimeUseCase(1);

      expect(result.isRight, true);
      expect(result.right, testAnimes);
    });

    test('returns Left(Exception) on failure', () async {
      when(mockRepository.getTopAnime(1, type: null, filter: null))
          .thenAnswer((_) async => Left(Exception('Failed to fetch')));

      final result = await getTopAnimeUseCase(1);

      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });
  });
}
