import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  @JsonKey(name: "data")
  final List<DatumForCharacter>? data;

  CharacterModel({this.data});

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class DatumForCharacter {
  final String? role;
  final Character? character;

  DatumForCharacter({this.role, this.character});

  factory DatumForCharacter.fromJson(Map<String, dynamic> json) =>
      _$DatumForCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$DatumForCharacterToJson(this);
}

@JsonSerializable()
class Character {
  @JsonKey(name: "mal_id")
  final int? malId;
  final String? url;
  final Map<String, ImageModelForCharacter>? images;
  final String? name;

  Character({this.malId, this.url, this.images, this.name});

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class ImageModelForCharacter {
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "small_image_url")
  final String? smallImageUrl;
  @JsonKey(name: "large_image_url")
  final String? largeImageUrl;

  ImageModelForCharacter(
      {this.imageUrl, this.smallImageUrl, this.largeImageUrl,});

  factory ImageModelForCharacter.fromJson(Map<String, dynamic> json) =>
      _$ImageModelForCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelForCharacterToJson(this);
}
