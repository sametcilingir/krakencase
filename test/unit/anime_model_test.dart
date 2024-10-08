import 'package:flutter_test/flutter_test.dart';
import 'package:krakencase/layers/data_layer/models/anime_model.dart';

void main() {
  group('AnimeModel', () {
    test('fromJson should return valid AnimeModel', () {
      final json = {
        "data": [
          {
            "mal_id": 1,
            "title": "Test Anime",
            "images": {
              "jpg": {"image_url": "http://example.com/image.jpg"}
            },
            "score": 8.5,
            "episodes": 24,
            "synopsis": "Test synopsis",
            "genres": []
          }
        ],
        "pagination": {
          "last_visible_page": 10,
          "has_next_page": true,
          "items": {"count": 25, "total": 250, "per_page": 25}
        }
      };

      final animeModel = AnimeModel.fromJson(json);

      expect(animeModel.data, isNotNull);
      expect(animeModel.data!.length, 1);
      expect(animeModel.data!.first.title, "Test Anime");
      expect(animeModel.pagination, isNotNull);
      expect(animeModel.pagination!.hasNextPage, true);
    });

    test('toJson should return valid JSON', () {
      final animeModel = AnimeModel(
        data: [
          DatumForAnime(
            malId: 1,
            title: "Test Anime",
            images: {
              "jpg": ImageModelForAnime(imageUrl: "http://example.com/image.jpg"),
            },
            score: 8.5,
            episodes: 24,
            synopsis: "Test synopsis",
            genres: [],
          ),
        ],
        pagination: Pagination(
          lastVisiblePage: 10,
          hasNextPage: true,
          items: Items(count: 25, total: 250, perPage: 25),
        ),
      );

      final json = animeModel.toJson();

      expect(json['data'], isA<List<DatumForAnime>>());
      expect(json['pagination'], isA<Pagination>());
    });
  });
}