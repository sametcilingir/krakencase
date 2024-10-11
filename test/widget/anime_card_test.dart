import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';
import 'package:krakencase/layers/presentation_layer/widgets/anime_card.dart';

void main() {
  group('AnimeCard Widget Tests', () {
    const animeWithImage = AnimeEntity(
      id: 1,
      title: 'Test Anime',
      imageUrl: 'https://placehold.co/600x400.png',
      score: 8.5,
      episodes: 24,
      synopsis: 'This is a test synopsis.',
      genres: ['Action', 'Adventure'],
      characters: [],
    );

    const animeWithoutImage = AnimeEntity(
      id: 2,
      title: 'No Image Anime',
      imageUrl: '',
      score: 7.2,
      episodes: 12,
      synopsis: 'This anime has no image.',
      genres: ['Drama'],
      characters: [],
    );

    setUpAll(() => HttpOverrides.global = null);

    testWidgets('Displays image when imageUrl is provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AnimeCard(
            anime: animeWithImage,
            onTap: () {},
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.byKey(const Key('anime_card_placeholder')), findsNothing);
    });

    testWidgets('Displays placeholder when imageUrl is empty', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AnimeCard(
            anime: animeWithoutImage,
            onTap: () {},
          ),
        ),
      );

      expect(find.byKey(const Key('anime_card_placeholder')), findsOneWidget);
      expect(find.byType(Image), findsNothing);
    });

    testWidgets('Displays title and score correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AnimeCard(
            anime: animeWithImage,
            onTap: () {},
          ),
        ),
      );

      expect(find.text('Test Anime'), findsOneWidget);
      expect(find.text('Score: 8.5'), findsOneWidget);
    });

    testWidgets('onTap callback is triggered when card is tapped', (WidgetTester tester) async {
      var isTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: AnimeCard(
            anime: animeWithImage,
            onTap: () {
              isTapped = true;
            },
          ),
        ),
      );

      final cardFinder = find.byKey(const Key('anime_card_gesture_detector'));
      expect(cardFinder, findsOneWidget);
      await tester.tap(cardFinder);
      await tester.pumpAndSettle();
      expect(isTapped, isTrue);
    });

    testWidgets('Displays ListTile with correct title and subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AnimeCard(
            anime: animeWithImage,
            onTap: () {},
          ),
        ),
      );

      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text('Test Anime'), findsOneWidget);
      expect(find.text('Score: 8.5'), findsOneWidget);
    });
  });
}
