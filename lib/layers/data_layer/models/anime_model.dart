import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable()
class AnimeModel {
  @JsonKey(name: "data")
  final List<DatumForAnime>? data;
  @JsonKey(name: "pagination")
  final Pagination? pagination;

  AnimeModel({this.data, this.pagination});

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}

@JsonSerializable()
class DatumForAnime {
  @JsonKey(name: "mal_id")
  final int malId;
  final String title;
  final Map<String, ImageModelForAnime> images;
  final num? score;
  final int? episodes;
  final String? synopsis;
  final List<Demographic>? genres;

  DatumForAnime({
    required this.malId,
    required this.title,
    required this.images,
    this.score,
    this.episodes,
    this.synopsis,
    this.genres,
  });

  factory DatumForAnime.fromJson(Map<String, dynamic> json) =>
      _$DatumForAnimeFromJson(json);
  Map<String, dynamic> toJson() => _$DatumForAnimeToJson(this);
}

@JsonSerializable()
class Demographic {
  @JsonKey(name: "mal_id")
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  Demographic({this.malId, this.type, this.name, this.url});

  factory Demographic.fromJson(Map<String, dynamic> json) =>
      _$DemographicFromJson(json);
  Map<String, dynamic> toJson() => _$DemographicToJson(this);
}

@JsonSerializable()
class ImageModelForAnime {
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "small_image_url")
  final String? smallImageUrl;
  @JsonKey(name: "large_image_url")
  final String? largeImageUrl;

  ImageModelForAnime({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  factory ImageModelForAnime.fromJson(Map<String, dynamic> json) =>
      _$ImageModelForAnimeFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelForAnimeToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "last_visible_page")
  final int? lastVisiblePage;
  @JsonKey(name: "has_next_page")
  final bool? hasNextPage;
  final Items? items;

  Pagination({this.lastVisiblePage, this.hasNextPage, this.items});

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Items {
  final int? count;
  final int? total;
  @JsonKey(name: "per_page")
  final int? perPage;

  Items({this.count, this.total, this.perPage});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
