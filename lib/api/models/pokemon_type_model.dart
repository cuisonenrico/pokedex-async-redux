import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';

part 'pokemon_type_model.freezed.dart';
part 'pokemon_type_model.g.dart';

@freezed
class PokemonType with _$PokemonType {
  factory PokemonType({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'types') List<SubType>? subType,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);
}