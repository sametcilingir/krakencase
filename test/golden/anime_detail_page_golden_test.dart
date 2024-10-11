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

    when(mockAnimeDetailBloc.stream).thenAnswer((_) => StreamController<AnimeDetailState>.broadcast().stream);
    when(mockAnimeDetailBloc.state).thenReturn(AnimeDetailInitial());
  });

  tearDown(() {
    locator.reset();
  });

  testWidgets('AnimeDetailPage golden test', (WidgetTester tester) async {
    const testAnime = AnimeEntity(
      id: 1,
      title: "Test Anime",
      imageUrl: "https://placehold.co/600x400.jpg",
      score: 8.5,
      episodes: 24,
      synopsis: "Test synopsis",
      genres: ["Action"],
    );
    when(mockAnimeDetailBloc.state).thenReturn(const AnimeDetailLoaded(testAnime));

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MaterialApp(home: AnimeDetailPage(animeId: 1)));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AnimeDetailPage),
        matchesGoldenFile('anime_detail_page.png'),
      );
    });
  });
}
