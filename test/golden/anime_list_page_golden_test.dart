import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_list/view/anime_list_page.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_list/bloc/anime_list_bloc.dart';
import 'package:krakencase/layers/application_layer/di/locator.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'dart:async';
import '../mocks.mocks.dart';
import 'method_channel_mock.dart'; 

void main() {
  late MockAnimeListBloc mockAnimeListBloc;

  setUp(() {
    MethodChannelMock.setUp(); 

    mockAnimeListBloc = MockAnimeListBloc();
    locator.registerSingleton<AnimeListBloc>(mockAnimeListBloc);

    when(mockAnimeListBloc.stream)
        .thenAnswer((_) => StreamController<AnimeListState>.broadcast().stream);
    when(mockAnimeListBloc.state).thenReturn(const AnimeListInitial());

    when(mockAnimeListBloc.add(any)).thenReturn(null);
  });

  tearDown(() {
    MethodChannelMock.tearDown(); 
    locator.reset();
  });

  testWidgets('AnimeListPage golden test', (WidgetTester tester) async {
    final testAnimes = [
      const AnimeEntity(
        id: 1,
        title: "Test Anime",
        imageUrl: "http://example.com/image.jpg",
        score: 8.5,
        episodes: 24,
        synopsis: "Test synopsis",
        genres: ["Action"],
      ),
    ];
    when(mockAnimeListBloc.state).thenReturn(AnimeListLoaded(testAnimes));

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MaterialApp(home: AnimeListPage()));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AnimeListPage),
        matchesGoldenFile('anime_list_page.png'),
      );
    });
  });
}