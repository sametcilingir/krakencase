import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable()
class AnimeModel {
  @JsonKey(name: "data")
  final AnimeDataModel? data;
  @JsonKey(name: "pagination")
  final AnimePaginationModel? pagination;

  AnimeModel({this.data, this.pagination});

  factory AnimeModel.fromJson(Map<String, dynamic> json) => _$AnimeModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}

@JsonSerializable()
class TopAnimeModel {
  @JsonKey(name: "data")
  final List<AnimeDataModel>? data;
  @JsonKey(name: "pagination")
  final AnimePaginationModel? pagination;

  TopAnimeModel({this.data, this.pagination});

  factory TopAnimeModel.fromJson(Map<String, dynamic> json) => _$TopAnimeModelFromJson(json);
  Map<String, dynamic> toJson() => _$TopAnimeModelToJson(this);
}

@JsonSerializable()
class AnimeDataModel {
  @JsonKey(name: "mal_id")
  final int malId;
  final String title;
  final Map<String, AnimeImageModel> images;
  final num? score;
  final int? episodes;
  final String? synopsis;
  final List<AnimeDemographicModel>? genres;

  AnimeDataModel({
    required this.malId,
    required this.title,
    required this.images,
    this.score,
    this.episodes,
    this.synopsis,
    this.genres,
  });

  factory AnimeDataModel.fromJson(Map<String, dynamic> json) => _$AnimeDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeDataModelToJson(this);
}

@JsonSerializable()
class AnimeDemographicModel {
  @JsonKey(name: "mal_id")
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  AnimeDemographicModel({this.malId, this.type, this.name, this.url});

  factory AnimeDemographicModel.fromJson(Map<String, dynamic> json) => _$AnimeDemographicModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeDemographicModelToJson(this);
}

@JsonSerializable()
class AnimeImageModel {
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "small_image_url")
  final String? smallImageUrl;
  @JsonKey(name: "large_image_url")
  final String? largeImageUrl;

  AnimeImageModel({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  factory AnimeImageModel.fromJson(Map<String, dynamic> json) => _$AnimeImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeImageModelToJson(this);
}

@JsonSerializable()
class AnimePaginationModel {
  @JsonKey(name: "last_visible_page")
  final int? lastVisiblePage;
  @JsonKey(name: "has_next_page")
  final bool? hasNextPage;
  final AnimeItemsModel? items;

  AnimePaginationModel({this.lastVisiblePage, this.hasNextPage, this.items});

  factory AnimePaginationModel.fromJson(Map<String, dynamic> json) => _$AnimePaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimePaginationModelToJson(this);
}

@JsonSerializable()
class AnimeItemsModel {
  final int? count;
  final int? total;
  @JsonKey(name: "per_page")
  final int? perPage;

  AnimeItemsModel({this.count, this.total, this.perPage});

  factory AnimeItemsModel.fromJson(Map<String, dynamic> json) => _$AnimeItemsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeItemsModelToJson(this);
}
