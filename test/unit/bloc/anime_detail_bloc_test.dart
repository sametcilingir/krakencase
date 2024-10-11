import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/domain_layer/usecases/get_anime_detail_usecase.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_detail/bloc/anime_detail_bloc.dart';
import 'package:krakencase/layers/application_layer/handlers/exception_handler.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:get_it/get_it.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockGetAnimeDetailUseCase mockGetAnimeDetailUseCase;
  late MockExceptionHandler mockExceptionHandler;
  final locator = GetIt.instance;

  setUp(() {
    mockGetAnimeDetailUseCase = MockGetAnimeDetailUseCase();
    mockExceptionHandler = MockExceptionHandler();

    locator.registerLazySingleton<GetAnimeDetailUseCase>(
      () => mockGetAnimeDetailUseCase,
    );
    locator.registerLazySingleton<ExceptionHandler>(() => mockExceptionHandler);
  });

  tearDown(() {
    locator.reset();
  });

  group('AnimeDetailBloc', () {
    const animeId = 1;
    const anime = AnimeEntity(
      id: animeId,
      title: 'Test Anime',
      imageUrl: 'https://placehold.co/600x400.png',
      score: 9.0,
      episodes: 24,
      synopsis: 'This is a test synopsis.',
      genres: ['Action', 'Adventure'],
      characters: [],
    );

    blocTest<AnimeDetailBloc, AnimeDetailState>(
      'emits [AnimeDetailLoading, AnimeDetailLoaded] when FetchAnimeDetailEvent is successful',
      build: () {
        when(mockGetAnimeDetailUseCase.call(animeId)).thenAnswer((_) async => const Right(anime));
        return AnimeDetailBloc(mockGetAnimeDetailUseCase);
      },
      act: (bloc) => bloc.add(const FetchAnimeDetailEvent(animeId)),
      expect: () => [
        AnimeDetailLoading(),
        const AnimeDetailLoaded(anime),
      ],
      verify: (_) {
        verify(mockGetAnimeDetailUseCase.call(animeId)).called(1);
      },
    );

    blocTest<AnimeDetailBloc, AnimeDetailState>(
      'emits [AnimeDetailLoading, AnimeDetailError] when FetchAnimeDetailEvent fails',
      build: () {
        when(mockGetAnimeDetailUseCase.call(animeId)).thenAnswer((_) async => Left(Exception('Failed to load')));
        return AnimeDetailBloc(mockGetAnimeDetailUseCase);
      },
      act: (bloc) => bloc.add(const FetchAnimeDetailEvent(animeId)),
      expect: () => [
        AnimeDetailLoading(),
        const AnimeDetailError('Exception: Failed to load'),
      ],
      verify: (_) {
        verify(mockGetAnimeDetailUseCase.call(animeId)).called(1);
        verify(mockExceptionHandler.recordError(any, any)).called(1);
      },
    );
  });
}
