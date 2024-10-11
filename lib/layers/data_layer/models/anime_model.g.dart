// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
      data: json['data'] == null
          ? null
          : AnimeDataModel.fromJson(json['data'] as Map<String, dynamic>),
      pagination: json['pagination'] == null
          ? null
          : AnimePaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

TopAnimeModel _$TopAnimeModelFromJson(Map<String, dynamic> json) =>
    TopAnimeModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AnimeDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : AnimePaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopAnimeModelToJson(TopAnimeModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

AnimeDataModel _$AnimeDataModelFromJson(Map<String, dynamic> json) =>
    AnimeDataModel(
      malId: json['mal_id'] as int,
      title: json['title'] as String,
      images: (json['images'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, AnimeImageModel.fromJson(e as Map<String, dynamic>)),
      ),
      score: json['score'] as num?,
      episodes: json['episodes'] as int?,
      synopsis: json['synopsis'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map(
              (e) => AnimeDemographicModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimeDataModelToJson(AnimeDataModel instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'title': instance.title,
      'images': instance.images,
      'score': instance.score,
      'episodes': instance.episodes,
      'synopsis': instance.synopsis,
      'genres': instance.genres,
    };

AnimeDemographicModel _$AnimeDemographicModelFromJson(
        Map<String, dynamic> json) =>
    AnimeDemographicModel(
      malId: json['mal_id'] as int?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$AnimeDemographicModelToJson(
        AnimeDemographicModel instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'type': instance.type,
      'name': instance.name,
      'url': instance.url,
    };

AnimeImageModel _$AnimeImageModelFromJson(Map<String, dynamic> json) =>
    AnimeImageModel(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );

Map<String, dynamic> _$AnimeImageModelToJson(AnimeImageModel instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'small_image_url': instance.smallImageUrl,
      'large_image_url': instance.largeImageUrl,
    };

AnimePaginationModel _$AnimePaginationModelFromJson(
        Map<String, dynamic> json) =>
    AnimePaginationModel(
      lastVisiblePage: json['last_visible_page'] as int?,
      hasNextPage: json['has_next_page'] as bool?,
      items: json['items'] == null
          ? null
          : AnimeItemsModel.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimePaginationModelToJson(
        AnimePaginationModel instance) =>
    <String, dynamic>{
      'last_visible_page': instance.lastVisiblePage,
      'has_next_page': instance.hasNextPage,
      'items': instance.items,
    };

AnimeItemsModel _$AnimeItemsModelFromJson(Map<String, dynamic> json) =>
    AnimeItemsModel(
      count: json['count'] as int?,
      total: json['total'] as int?,
      perPage: json['per_page'] as int?,
    );

Map<String, dynamic> _$AnimeItemsModelToJson(AnimeItemsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'total': instance.total,
      'per_page': instance.perPage,
    };
