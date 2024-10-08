// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DatumForAnime.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

DatumForAnime _$DatumForAnimeFromJson(Map<String, dynamic> json) =>
    DatumForAnime(
      malId: json['mal_id'] as int,
      title: json['title'] as String,
      images: (json['images'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, ImageModelForAnime.fromJson(e as Map<String, dynamic>)),
      ),
      score: json['score'] as num?,
      episodes: json['episodes'] as int?,
      synopsis: json['synopsis'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumForAnimeToJson(DatumForAnime instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'title': instance.title,
      'images': instance.images,
      'score': instance.score,
      'episodes': instance.episodes,
      'synopsis': instance.synopsis,
      'genres': instance.genres,
    };

Demographic _$DemographicFromJson(Map<String, dynamic> json) => Demographic(
      malId: json['mal_id'] as int?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$DemographicToJson(Demographic instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'type': instance.type,
      'name': instance.name,
      'url': instance.url,
    };

ImageModelForAnime _$ImageModelForAnimeFromJson(Map<String, dynamic> json) =>
    ImageModelForAnime(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );

Map<String, dynamic> _$ImageModelForAnimeToJson(ImageModelForAnime instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'small_image_url': instance.smallImageUrl,
      'large_image_url': instance.largeImageUrl,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      lastVisiblePage: json['last_visible_page'] as int?,
      hasNextPage: json['has_next_page'] as bool?,
      items: json['items'] == null
          ? null
          : Items.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'last_visible_page': instance.lastVisiblePage,
      'has_next_page': instance.hasNextPage,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      count: json['count'] as int?,
      total: json['total'] as int?,
      perPage: json['per_page'] as int?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'count': instance.count,
      'total': instance.total,
      'per_page': instance.perPage,
    };
