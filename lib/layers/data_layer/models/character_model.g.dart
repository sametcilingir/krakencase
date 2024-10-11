// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CharacterDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CharacterDataModel _$CharacterDataModelFromJson(Map<String, dynamic> json) =>
    CharacterDataModel(
      role: json['role'] as String?,
      character: json['character'] == null
          ? null
          : SingleCharacterModel.fromJson(
              json['character'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterDataModelToJson(CharacterDataModel instance) =>
    <String, dynamic>{
      'role': instance.role,
      'character': instance.character,
    };

SingleCharacterModel _$SingleCharacterModelFromJson(
        Map<String, dynamic> json) =>
    SingleCharacterModel(
      malId: json['mal_id'] as int?,
      url: json['url'] as String?,
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, CharacterImageModel.fromJson(e as Map<String, dynamic>)),
      ),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SingleCharacterModelToJson(
        SingleCharacterModel instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url,
      'images': instance.images,
      'name': instance.name,
    };

CharacterImageModel _$CharacterImageModelFromJson(Map<String, dynamic> json) =>
    CharacterImageModel(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );

Map<String, dynamic> _$CharacterImageModelToJson(
        CharacterImageModel instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'small_image_url': instance.smallImageUrl,
      'large_image_url': instance.largeImageUrl,
    };
