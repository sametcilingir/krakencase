import 'package:equatable/equatable.dart';

import '../../data_layer/models/character_model.dart';

class CharacterEntity extends Equatable {
  final String? name;
  final String? imageUrl;

  const CharacterEntity({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  factory CharacterEntity.fromModel(DatumForCharacter model) {
    return CharacterEntity(
      name: model.character?.name,
      imageUrl: model.character?.images?['jpg']?.imageUrl,
    );
  }
}
