
import 'package:flutter_test/flutter_test.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_detail/bloc/anime_detail_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/domain_layer/usecases/get_anime_detail_usecase.dart';
import 'package:bloc_test/bloc_test.dart';

import '../mocks.mocks.dart';
void main() {
  late MockAnimeRepositoryBase mockRepository;
  late GetAnimeDetailUseCase getAnimeDetailUseCase;
  late AnimeDetailBloc animeDetailBloc;

  setUp(() {
    mockRepository = MockAnimeRepositoryBase();
    getAnimeDetailUseCase = GetAnimeDetailUseCase(mockRepository);
    animeDetailBloc = AnimeDetailBloc(getAnimeDetailUseCase);
  });

  tearDown(() {
    animeDetailBloc.close();
  });

  group('AnimeDetailBloc', () {
    const testAnime = AnimeEntity(
      id: 1,
      title: "Test Anime",
      imageUrl: "http://example.com/image.jpg",
      score: 8.5,
      episodes: 24,
      synopsis: "Test synopsis",
      genres: [],
    );

    blocTest<AnimeDetailBloc, AnimeDetailState>(
      'emits [AnimeDetailLoading, AnimeDetailLoaded] when FetchAnimeDetailEvent is added and succeeds',
      build: () {
        when(mockRepository.getAnimeDetail(1))
            .thenAnswer((_) async => const Right(testAnime));
        return animeDetailBloc;
      },
      act: (bloc) => bloc.add(const FetchAnimeDetailEvent(1)),
      expect: () => [
        AnimeDetailLoading(),
        const AnimeDetailLoaded(testAnime),
      ],
      verify: (_) {
        verify(mockRepository.getAnimeDetail(1)).called(1);
      },
    );

    blocTest<AnimeDetailBloc, AnimeDetailState>(
      'emits [AnimeDetailLoading, AnimeDetailError] when FetchAnimeDetailEvent is added and fails',
      build: () {
        when(mockRepository.getAnimeDetail(1))
            .thenAnswer((_) async => Left(Exception('Failed to fetch detail')));
        return animeDetailBloc;
      },
      act: (bloc) => bloc.add(const FetchAnimeDetailEvent(1)),
      expect: () => [
        AnimeDetailLoading(),
        const AnimeDetailError('Exception: Failed to fetch detail'),
      ],
      verify: (_) {
        verify(mockRepository.getAnimeDetail(1)).called(1);
      },
    );
  });
}