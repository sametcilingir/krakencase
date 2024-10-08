import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_detail/view/anime_detail_page.dart';
import 'package:mockito/mockito.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_detail/bloc/anime_detail_bloc.dart';
import 'package:krakencase/layers/application_layer/di/locator.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'dart:async';

import '../mocks.mocks.dart';

void main() {
  late MockAnimeDetailBloc mockAnimeDetailBloc;

  setUp(() {
    mockAnimeDetailBloc = MockAnimeDetailBloc();
    locator.registerSingleton<AnimeDetailBloc>(mockAnimeDetailBloc);

    when(mockAnimeDetailBloc.stream).thenAnswer(
        (_) => StreamController<AnimeDetailState>.broadcast().stream,);
    when(mockAnimeDetailBloc.state).thenReturn(AnimeDetailInitial());
  });

  tearDown(() {
    locator.reset();
  });

  testWidgets('AnimeDetailPage displays loading indicator initially',
      (WidgetTester tester) async {
    when(mockAnimeDetailBloc.state).thenReturn(AnimeDetailLoading());

    await mockNetworkImagesFor(() async {
      await tester
          .pumpWidget(const MaterialApp(home: AnimeDetailPage(animeId: 1)));
    });

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('AnimeDetailPage displays anime details after data is loaded',
      (WidgetTester tester) async {
    const testAnime = AnimeEntity(
      id: 1,
      title: "Test Anime",
      imageUrl: "http://example.com/image.jpg",
      score: 8.5,
      episodes: 24,
      synopsis: "Test synopsis",
      genres: ["Action"],
    );
    when(mockAnimeDetailBloc.state)
        .thenReturn(const AnimeDetailLoaded(testAnime));

    await mockNetworkImagesFor(() async {
      await tester
          .pumpWidget(const MaterialApp(home: AnimeDetailPage(animeId: 1)));
      await tester.pumpAndSettle(); 
    });

    expect(find.text('Test Anime'), findsOneWidget);
    expect(find.text('Score: 8.5'), findsOneWidget);
    expect(find.text('Episodes: 24'), findsOneWidget);
    expect(find.text('Synopsis: Test synopsis'), findsOneWidget);
    expect(find.text('Genres: Action'), findsOneWidget);
  });

  testWidgets('AnimeDetailPage displays error message on failure',
      (WidgetTester tester) async {
    when(mockAnimeDetailBloc.state)
        .thenReturn(const AnimeDetailError('Failed to load data'));

    await mockNetworkImagesFor(() async {
      await tester
          .pumpWidget(const MaterialApp(home: AnimeDetailPage(animeId: 1)));
      await tester.pumpAndSettle(); 
    });

    expect(find.text('Error: Failed to load data'), findsOneWidget);
  });
}
