import 'package:counter_async_redux/api/models/specificType_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemonType_model.freezed.dart';
part 'pokemonType_model.g.dart';

@freezed
class PokemonType with _$PokemonType {
  factory PokemonType({
    @JsonKey(name: 'slot') int? id,
    @JsonKey(name: 'type') SpecificType? type,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}
