import 'package:counter_async_redux/api/models/specific_type_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type_model.freezed.dart';
part 'pokemon_type_model.g.dart';

@freezed
class PokemonType with _$PokemonType {
  factory PokemonType({
    @JsonKey(name: 'slot') int? id,
    @JsonKey(name: 'type') SpecificType? type,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}
