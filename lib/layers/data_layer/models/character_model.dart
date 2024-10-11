import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  @JsonKey(name: "data")
  final List<CharacterDataModel>? data;

  CharacterModel({this.data});

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class CharacterDataModel {
  final String? role;
  final SingleCharacterModel? character;

  CharacterDataModel({this.role, this.character});

  factory CharacterDataModel.fromJson(Map<String, dynamic> json) => _$CharacterDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterDataModelToJson(this);
}

@JsonSerializable()
class SingleCharacterModel {
  @JsonKey(name: "mal_id")
  final int? malId;
  final String? url;
  final Map<String, CharacterImageModel>? images;
  final String? name;

  SingleCharacterModel({this.malId, this.url, this.images, this.name});

  factory SingleCharacterModel.fromJson(Map<String, dynamic> json) => _$SingleCharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$SingleCharacterModelToJson(this);
}

@JsonSerializable()
class CharacterImageModel {
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "small_image_url")
  final String? smallImageUrl;
  @JsonKey(name: "large_image_url")
  final String? largeImageUrl;

  CharacterImageModel({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory CharacterImageModel.fromJson(Map<String, dynamic> json) => _$CharacterImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterImageModelToJson(this);
}
