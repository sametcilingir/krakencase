import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/presentation_layer/widgets/anime_card.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('AnimeCard displays anime details correctly',
      (WidgetTester tester) async {
    const anime = AnimeEntity(
      id: 1,
      title: "Test Anime",
      imageUrl: "http://example.com/image.jpg",
      score: 8.5,
      episodes: 24,
      synopsis: "Test synopsis",
      genres: ["Action"],
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimeCard(anime: anime),
          ),
        ),
      );
    });

    expect(find.text('Test Anime'), findsOneWidget);
    expect(find.text('Score: 8.5'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('AnimeCard displays placeholder if imageUrl is empty',
      (WidgetTester tester) async {
    const anime = AnimeEntity(
      id: 1,
      title: "Test Anime",
      imageUrl: "", 
      score: 8.5,
      episodes: 24,
      synopsis: "Test synopsis",
      genres: ["Action"],
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimeCard(anime: anime),
          ),
        ),
      );
    });

    expect(find.byKey(const Key('anime_card_placeholder')), findsOneWidget);
  });
}
