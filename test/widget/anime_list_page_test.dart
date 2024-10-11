import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_list/bloc/anime_list_bloc.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_list/view/anime_list_page.dart';
import 'package:krakencase/layers/application_layer/constants/string_constants.dart';
import 'package:krakencase/layers/application_layer/handlers/exception_handler.dart';
import 'package:krakencase/layers/application_layer/handlers/method_channel_handler.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main() {
  final locator = GetIt.instance;

  setUpAll(() {
    locator.reset();
    locator.registerLazySingleton<ExceptionHandler>(() => MockExceptionHandler());
    locator.registerLazySingleton<MethodChannelHandler>(
      () => MockMethodChannelHandler(),
    );
  });

  group('AnimeListPage Widget Tests', () {
    late MockAnimeListBloc mockAnimeListBloc;
    late MockMethodChannelHandler mockMethodChannelHandler;

    const mockAnimes = [
      AnimeEntity(
        id: 1,
        title: 'Test Anime 1',
        imageUrl: 'https://placehold.co/600x400.png',
        score: 8.5,
        episodes: 24,
        synopsis: 'This is a test synopsis for Anime 1.',
        genres: ['Action', 'Adventure'],
        characters: [],
      ),
      AnimeEntity(
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

    setUp(() {
      mockAnimeListBloc = MockAnimeListBloc();
      mockMethodChannelHandler = MockMethodChannelHandler();

      locator.registerLazySingleton<AnimeListBloc>(() => mockAnimeListBloc);

      locator.registerLazySingleton<MethodChannelHandler>(
        () => mockMethodChannelHandler,
      );

      when(mockAnimeListBloc.typeOptions).thenReturn(StringConstants.typeOptionsMap);
      when(mockAnimeListBloc.filterOptions).thenReturn(StringConstants.filterOptionsMap);
    });

    setUpAll(() => HttpOverrides.global = null);

    tearDown(() {
      locator.unregister<AnimeListBloc>();
      locator.unregister<MethodChannelHandler>();
      reset(mockAnimeListBloc);
      reset(mockMethodChannelHandler);
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: BlocProvider<AnimeListBloc>(
          create: (context) => locator<AnimeListBloc>()..add(const CallMethodChannelEvent()),
          child: Scaffold(
            appBar: AppBar(
              title: const Text(StringConstants.animeListTitle),
              actions: const [
                TypeDropdown(),
                SizedBox(width: 10),
                FilterDropdown(),
              ],
            ),
            body: const AnimeListView(),
          ),
        ),
      );
    }

    testWidgets('Displays loading indicator when state is loading and animes are empty', (WidgetTester tester) async {
      when(mockAnimeListBloc.state).thenReturn(const AnimeListLoading());
      when(mockAnimeListBloc.stream).thenAnswer(
        (_) => Stream<AnimeListState>.fromIterable([
          const AnimeListLoading(),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('Displays list of animes when state is loaded', (WidgetTester tester) async {
      when(mockAnimeListBloc.state).thenReturn(const AnimeListLoaded(animes: mockAnimes));
      when(mockAnimeListBloc.stream).thenAnswer(
        (_) => Stream<AnimeListState>.fromIterable([
          const AnimeListLoaded(animes: mockAnimes),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Test Anime 1'), findsOneWidget);
      expect(find.text('Score: 8.5'), findsOneWidget);
      expect(find.text('Test Anime 2'), findsOneWidget);
      expect(find.text('Score: 7.2'), findsOneWidget);
    });

    testWidgets('Displays empty message when anime list is empty', (WidgetTester tester) async {
      when(mockAnimeListBloc.state).thenReturn(const AnimeListLoaded(animes: []));
      when(mockAnimeListBloc.stream).thenAnswer(
        (_) => Stream<AnimeListState>.fromIterable([
          const AnimeListLoaded(animes: []),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('No anime found'), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('Displays error message when state is error', (WidgetTester tester) async {
      when(mockAnimeListBloc.state).thenReturn(const AnimeListError(message: 'Failed to load'));
      when(mockAnimeListBloc.stream).thenAnswer(
        (_) => Stream<AnimeListState>.fromIterable([
          const AnimeListError(message: 'Failed to load'),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Failed to load'), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('Displays loading indicator at the bottom when loading more', (WidgetTester tester) async {
      when(mockAnimeListBloc.state).thenReturn(
        const AnimeListLoading(animes: mockAnimes, hasReachedMax: false),
      );
      when(mockAnimeListBloc.stream).thenAnswer(
        (_) => Stream<AnimeListState>.fromIterable([
          const AnimeListLoading(animes: mockAnimes, hasReachedMax: false),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.drag(find.byType(ListView), const Offset(0, 500));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsWidgets);
    });
  });
}
