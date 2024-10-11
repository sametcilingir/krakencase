import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:krakencase/layers/application_layer/handlers/exception_handler.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_detail/bloc/anime_detail_bloc.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_detail/view/anime_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';

import '../mocks.mocks.dart';

void main() {
  final locator = GetIt.instance;

  setUpAll(() {
    locator.reset();
    locator.registerLazySingleton<ExceptionHandler>(() => MockExceptionHandler());
  });

  group('AnimeDetailPage Widget Tests', () {
    late MockAnimeDetailBloc mockAnimeDetailBloc;

    const mockAnime = AnimeEntity(
      id: 1,
      title: 'Test Anime',
      imageUrl: 'https://placehold.co/600x400.png',
      score: 9.0,
      episodes: 24,
      synopsis: 'This is a test synopsis.',
      genres: ['Action', 'Adventure'],
      characters: [],
    );

    setUp(() {
      mockAnimeDetailBloc = MockAnimeDetailBloc();
      locator.registerLazySingleton<AnimeDetailBloc>(() => mockAnimeDetailBloc);
    });

    tearDown(() {
      locator.unregister<AnimeDetailBloc>();
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: BlocProvider<AnimeDetailBloc>(
          create: (_) => locator<AnimeDetailBloc>(),
          child: const AnimeDetailPage(animeId: 1),
        ),
      );
    }

    testWidgets('Displays loading indicator when state is loading', (WidgetTester tester) async {
      when(mockAnimeDetailBloc.state).thenReturn(AnimeDetailLoading());
      when(mockAnimeDetailBloc.stream).thenAnswer((_) => Stream.fromIterable([AnimeDetailLoading()]));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Displays anime details when state is loaded', (WidgetTester tester) async {
      when(mockAnimeDetailBloc.state).thenReturn(const AnimeDetailLoaded(mockAnime));
      when(mockAnimeDetailBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const AnimeDetailLoaded(mockAnime)]),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Test Anime'), findsOneWidget);
      expect(find.text('Score: 9.0'), findsOneWidget);
      expect(find.text('Episodes: 24'), findsOneWidget);
      expect(find.text('Genres: Action, Adventure'), findsOneWidget);
      expect(find.text('Synopsis: This is a test synopsis.'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Displays error message when state is error', (WidgetTester tester) async {
      when(mockAnimeDetailBloc.state).thenReturn(const AnimeDetailError('Failed to load details'));
      when(mockAnimeDetailBloc.stream).thenAnswer(
        (_) => Stream.fromIterable(
          [const AnimeDetailError('Failed to load details')],
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('Error: Failed to load details'), findsOneWidget);
    });

    testWidgets('Displays placeholder when imageUrl is empty', (WidgetTester tester) async {
      const animeWithoutImage = AnimeEntity(
        id: 2,
        title: 'No Image Anime',
        imageUrl: '',
        score: 7.5,
        episodes: 12,
        synopsis: 'This anime has no image.',
        genres: ['Drama'],
        characters: [],
      );

      when(mockAnimeDetailBloc.state).thenReturn(const AnimeDetailLoaded(animeWithoutImage));
      when(mockAnimeDetailBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const AnimeDetailLoaded(animeWithoutImage)]),
      );
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      expect(find.byKey(const Key('anime_detail_sized_box')), findsOneWidget);
      expect(find.byType(Image), findsNothing);
    });
  });
}
