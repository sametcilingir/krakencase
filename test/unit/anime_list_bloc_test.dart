import 'package:flutter_test/flutter_test.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_list/bloc/anime_list_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/domain_layer/usecases/get_top_anime_usecase.dart';
import 'package:bloc_test/bloc_test.dart';

import '../mocks.mocks.dart';


void main() {
  late MockAnimeRepositoryBase mockRepository;
  late GetTopAnimeUseCase getTopAnimeUseCase;
  late AnimeListBloc animeListBloc;

  setUp(() {
    mockRepository = MockAnimeRepositoryBase();
    getTopAnimeUseCase = GetTopAnimeUseCase(mockRepository);
    animeListBloc = AnimeListBloc(getTopAnimeUseCase);
  });

  tearDown(() {
    animeListBloc.close();
  });

  group('AnimeListBloc', () {
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

    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListLoaded] when FetchAnimeListEvent is added and succeeds',
      build: () {
        when(mockRepository.getTopAnime(1, type: null, filter: null))
            .thenAnswer((_) async => Right(testAnimes));
        return animeListBloc;
      },
      act: (bloc) => bloc.add(const FetchAnimeListEvent(page: 1)),
      expect: () => [
        const AnimeListLoading([]),
        AnimeListLoaded(testAnimes),
      ],
      verify: (_) {
        verify(mockRepository.getTopAnime(1, type: null, filter: null)).called(1);
      },
    );

    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListError] when FetchAnimeListEvent is added and fails',
      build: () {
        when(mockRepository.getTopAnime(1, type: null, filter: null))
            .thenAnswer((_) async => Left(Exception('Failed to fetch')));
        return animeListBloc;
      },
      act: (bloc) => bloc.add(const FetchAnimeListEvent(page: 1)),
      expect: () => [
        const AnimeListLoading([]),
        const AnimeListError('Exception: Failed to fetch', []),
      ],
      verify: (_) {
        verify(mockRepository.getTopAnime(1, type: null, filter: null)).called(1);
      },
    );
  });
}