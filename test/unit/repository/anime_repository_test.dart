import 'package:flutter_test/flutter_test.dart';
import 'package:krakencase/layers/data_layer/models/character_model.dart';
import 'package:mockito/mockito.dart';
import 'package:krakencase/layers/data_layer/models/anime_model.dart';
import 'package:krakencase/layers/domain_layer/repositories/anime/base/anime_repository_base.dart';
import 'package:krakencase/layers/domain_layer/repositories/anime/anime_repository.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockAnimeRemoteServiceBase mockRemoteService;
  late AnimeRepositoryBase animeRepository;

  setUp(() {
    mockRemoteService = MockAnimeRemoteServiceBase();
    animeRepository = AnimeRepository(remoteService: mockRemoteService);
  });

  group('AnimeRepository', () {
    test('getTopAnime returns list of AnimeEntity on success', () async {
      final testAnimeModel = TopAnimeModel(
        data: [
          AnimeDataModel(
            malId: 1,
            title: "Test Anime",
            images: {"jpg": AnimeImageModel(imageUrl: "http://example.com/image.jpg")},
            score: 8.5,
            episodes: 24,
            synopsis: "Test synopsis",
            genres: [],
          ),
        ],
        pagination: null,
      );

      when(mockRemoteService.getTopAnime(1, type: null, filter: null)).thenAnswer((_) async => testAnimeModel);

      final result = await animeRepository.getTopAnime(1);

      expect(result.isRight, true);
      expect(result.right.length, 1);
      expect(result.right.first.title, "Test Anime");
    });

    test('getTopAnime returns Left(Exception) on failure', () async {
      when(mockRemoteService.getTopAnime(1, type: null, filter: null)).thenThrow(Exception('Failed to fetch'));

      final result = await animeRepository.getTopAnime(1);

      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });

    test('getAnimeDetail returns AnimeEntity with characters on success', () async {
      final testModel = AnimeModel(
        data: AnimeDataModel(
          malId: 1,
          title: "Test Anime",
          images: {"jpg": AnimeImageModel(imageUrl: "http://example.com/image.jpg")},
          score: 8.5,
          episodes: 24,
          synopsis: "Test synopsis",
          genres: [],
        ),
        pagination: null,
      );

      final testCharacters = CharacterModel(
        data: [
          CharacterDataModel(
            role: "Main",
            character: SingleCharacterModel(
              malId: 1,
              url: "http://example.com/character",
              images: {
                "jpg": CharacterImageModel(
                  imageUrl: "http://example.com/character.jpg",
                )
              },
              name: "Test Character",
            ),
          ),
        ],
      );

      when(mockRemoteService.getAnimeDetail(1)).thenAnswer((_) async => testModel);
      when(mockRemoteService.getAnimeCharacters(1)).thenAnswer((_) async => testCharacters);

      final result = await animeRepository.getAnimeDetail(1);

      expect(result.isRight, true);
      final anime = result.right;
      expect(anime.title, "Test Anime");
      expect(anime.characters!.first.name, "Test Character");
    });

    test('getAnimeDetail returns Left(Exception) on failure', () async {
      when(mockRemoteService.getAnimeDetail(1)).thenThrow(Exception('Failed to fetch detail'));

      final result = await animeRepository.getAnimeDetail(1);

      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });
  });
}
