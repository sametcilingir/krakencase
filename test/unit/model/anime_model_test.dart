import 'package:flutter_test/flutter_test.dart';
import 'package:krakencase/layers/data_layer/models/anime_model.dart';

void main() {
  group('AnimeModel', () {
    test('fromJson and toJson for AnimeModel', () {
      final json = {
        "data": {
          "mal_id": 1,
          "title": "Naruto",
          "images": {
            "jpg": {"image_url": "https://example.com/image.jpg"}
          },
          "score": 8.5,
          "episodes": 220,
          "synopsis": "A young ninja who seeks recognition...",
          "genres": [
            {"mal_id": 1, "type": "anime", "name": "Action", "url": "https://example.com/action"}
          ]
        },
        "pagination": {
          "last_visible_page": 10,
          "has_next_page": true,
          "items": {"count": 20, "total": 200, "per_page": 20}
        }
      };

      final animeModel = AnimeModel.fromJson(json);
      expect(animeModel.data?.malId, 1);
      expect(animeModel.data?.title, "Naruto");
      expect(animeModel.data?.images["jpg"]?.imageUrl, "https://example.com/image.jpg");
      expect(animeModel.data?.score, 8.5);
      expect(animeModel.data?.episodes, 220);
      expect(animeModel.data?.synopsis, "A young ninja who seeks recognition...");
      expect(animeModel.data?.genres?.first.name, "Action");
      expect(animeModel.pagination?.lastVisiblePage, 10);
      expect(animeModel.pagination?.hasNextPage, true);
      expect(animeModel.pagination?.items?.count, 20);

      final jsonString = animeModel.toJson();
      expect(jsonString, jsonString);
    });

    test('fromJson and toJson for TopAnimeModel', () {
      final json = {
        "data": [
          {
            "mal_id": 1,
            "title": "Naruto",
            "images": {
              "jpg": {"image_url": "https://example.com/image.jpg"}
            },
            "score": 8.5,
            "episodes": 220,
            "synopsis": "A young ninja who seeks recognition...",
            "genres": [
              {"mal_id": 1, "type": "anime", "name": "Action", "url": "https://example.com/action"}
            ]
          }
        ],
        "pagination": {
          "last_visible_page": 10,
          "has_next_page": true,
          "items": {"count": 20, "total": 200, "per_page": 20}
        }
      };

      final topAnimeModel = TopAnimeModel.fromJson(json);
      expect(topAnimeModel.data?.first.malId, 1);
      expect(topAnimeModel.data?.first.title, "Naruto");
      expect(topAnimeModel.data?.first.images["jpg"]?.imageUrl, "https://example.com/image.jpg");
      expect(topAnimeModel.data?.first.score, 8.5);
      expect(topAnimeModel.data?.first.episodes, 220);
      expect(topAnimeModel.data?.first.synopsis, "A young ninja who seeks recognition...");
      expect(topAnimeModel.data?.first.genres?.first.name, "Action");
      expect(topAnimeModel.pagination?.lastVisiblePage, 10);
      expect(topAnimeModel.pagination?.hasNextPage, true);
      expect(topAnimeModel.pagination?.items?.count, 20);

      final jsonString = topAnimeModel.toJson();
      expect(jsonString, jsonString);
    });
  });
}
