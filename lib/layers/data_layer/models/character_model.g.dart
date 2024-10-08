// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DatumForCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DatumForCharacter _$DatumForCharacterFromJson(Map<String, dynamic> json) =>
    DatumForCharacter(
      role: json['role'] as String?,
      character: json['character'] == null
          ? null
          : Character.fromJson(json['character'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumForCharacterToJson(DatumForCharacter instance) =>
    <String, dynamic>{
      'role': instance.role,
      'character': instance.character,
    };

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      malId: json['mal_id'] as int?,
      url: json['url'] as String?,
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, ImageModelForCharacter.fromJson(e as Map<String, dynamic>)),
      ),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url,
      'images': instance.images,
      'name': instance.name,
    };

ImageModelForCharacter _$ImageModelForCharacterFromJson(
        Map<String, dynamic> json) =>
    ImageModelForCharacter(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );

Map<String, dynamic> _$ImageModelForCharacterToJson(
        ImageModelForCharacter instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'small_image_url': instance.smallImageUrl,
      'large_image_url': instance.largeImageUrl,
    };
