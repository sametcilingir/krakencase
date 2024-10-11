import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import 'package:krakencase/layers/application_layer/handlers/exception_handler.dart';
import 'package:krakencase/layers/application_layer/handlers/method_channel_handler.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/domain_layer/usecases/get_top_anime_usecase.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_list/bloc/anime_list_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockGetTopAnimeUseCase mockGetTopAnimeUseCase;
  late MockExceptionHandler mockExceptionHandler;
  late MockMethodChannelHandler mockMethodChannelHandler;
  final locator = GetIt.instance;

  setUp(() {
    mockGetTopAnimeUseCase = MockGetTopAnimeUseCase();
    mockExceptionHandler = MockExceptionHandler();
    mockMethodChannelHandler = MockMethodChannelHandler();

    locator.registerLazySingleton<GetTopAnimeUseCase>(
      () => mockGetTopAnimeUseCase,
    );
    locator.registerLazySingleton<ExceptionHandler>(
      () => mockExceptionHandler,
    );
    locator.registerLazySingleton<MethodChannelHandler>(
      () => mockMethodChannelHandler,
    );
  });

  tearDown(() {
    locator.reset();
  });

  group('AnimeListBloc', () {
    final mockAnimes = [
      const AnimeEntity(
        id: 1,
        title: 'Test Anime 1',
        imageUrl: 'https://placehold.co/600x400.png',
        score: 8.5,
        episodes: 24,
        synopsis: 'This is a test synopsis for Anime 1.',
        genres: ['Action', 'Adventure'],
        characters: [],
      ),
      const AnimeEntity(
        id: 2,
        title: 'Test Anime 2',
        imageUrl: '',
        score: 7.2,
        episodes: 12,
        synopsis: 'This is a test synopsis for Anime 2.',
        genres: ['Drama'],
        characters: [],
      ),
    ];

    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListLoaded] when FetchAnimeListEvent is successful',
      build: () {
        when(mockGetTopAnimeUseCase.call(1, type: null, filter: null)).thenAnswer((_) async => Right(mockAnimes));
        return AnimeListBloc(mockGetTopAnimeUseCase);
      },
      act: (bloc) => bloc.add(const FetchAnimeListEvent(page: 1)),
      expect: () => [
        const AnimeListLoading(
          animes: [],
          hasReachedMax: false,
          currentType: null,
          currentFilter: null,
        ),
        AnimeListLoaded(
          animes: mockAnimes,
          hasReachedMax: false,
          currentType: null,
          currentFilter: null,
        ),
      ],
      verify: (_) {
        verify(mockGetTopAnimeUseCase.call(1, type: null, filter: null)).called(1);
      },
    );

    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListError] when FetchAnimeListEvent fails',
      build: () {
        when(mockGetTopAnimeUseCase.call(1, type: null, filter: null))
            .thenAnswer((_) async => Left(Exception('Failed to load')));
        return AnimeListBloc(mockGetTopAnimeUseCase);
      },
      act: (bloc) => bloc.add(const FetchAnimeListEvent(page: 1)),
      expect: () => [
        const AnimeListLoading(
          animes: [],
          hasReachedMax: false,
          currentType: null,
          currentFilter: null,
        ),
        const AnimeListError(
          message: 'Exception: Failed to load',
          animes: [],
          hasReachedMax: false,
          currentType: null,
          currentFilter: null,
        ),
      ],
      verify: (_) {
        verify(mockGetTopAnimeUseCase.call(1, type: null, filter: null)).called(1);
        verify(mockExceptionHandler.recordError(any, any)).called(1);
      },
    );
    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListLoaded] when FetchAnimeListEvent for next page is successful',
      build: () {
        when(mockGetTopAnimeUseCase.call(2, type: null, filter: null)).thenAnswer((_) async => Right(mockAnimes));
        return AnimeListBloc(mockGetTopAnimeUseCase);
      },
      seed: () => AnimeListLoaded(
        animes: mockAnimes,
        hasReachedMax: false,
        currentType: null,
        currentFilter: null,
      ),
      act: (bloc) => bloc.add(const FetchAnimeListEvent(page: 2)),
      expect: () => [
        AnimeListLoading(
          animes: mockAnimes,
          hasReachedMax: false,
          currentType: null,
          currentFilter: null,
        ),
        AnimeListLoaded(
          animes: [...mockAnimes, ...mockAnimes],
          hasReachedMax: false,
          currentType: null,
          currentFilter: null,
        ),
      ],
      verify: (_) {
        verify(mockGetTopAnimeUseCase.call(2, type: null, filter: null)).called(1);
      },
    );

    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListLoaded with hasReachedMax=true] when FetchAnimeListEvent returns empty list',
      build: () {
        when(mockGetTopAnimeUseCase.call(2, type: null, filter: null)).thenAnswer((_) async => const Right([]));
        return AnimeListBloc(mockGetTopAnimeUseCase);
      },
      seed: () => AnimeListLoaded(
        animes: mockAnimes,
        hasReachedMax: false,
        currentType: null,
        currentFilter: null,
      ),
      act: (bloc) => bloc.add(const FetchAnimeListEvent(page: 2)),
      expect: () => [
        AnimeListLoading(
          animes: mockAnimes,
          hasReachedMax: false,
          currentType: null,
          currentFilter: null,
        ),
        AnimeListLoaded(
          animes: mockAnimes,
          hasReachedMax: true,
          currentType: null,
          currentFilter: null,
        ),
      ],
      verify: (_) {
        verify(mockGetTopAnimeUseCase.call(2, type: null, filter: null)).called(1);
      },
    );

    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListError] when ChangeFilterEvent fails',
      build: () {
        when(mockGetTopAnimeUseCase.call(1, type: 'movie', filter: 'upcoming'))
            .thenAnswer((_) async => Left(Exception('Failed to load')));
        return AnimeListBloc(mockGetTopAnimeUseCase);
      },
      act: (bloc) => bloc.add(const ChangeFilterEvent(type: 'movie', filter: 'upcoming')),
      expect: () => [
        const AnimeListLoading(
          animes: [],
          hasReachedMax: false,
          currentType: 'movie',
          currentFilter: 'upcoming',
        ),
        const AnimeListError(
          message: 'Exception: Failed to load',
          animes: [],
          hasReachedMax: false,
          currentType: 'movie',
          currentFilter: 'upcoming',
        ),
      ],
      verify: (_) {
        verify(mockGetTopAnimeUseCase.call(1, type: 'movie', filter: 'upcoming')).called(1);
        verify(mockExceptionHandler.recordError(any, any)).called(1);
      },
    );
  });
}
