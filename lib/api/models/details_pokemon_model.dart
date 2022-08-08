import 'package:pokedex_async_redux/api/models/ability_model.dart';
import 'package:pokedex_async_redux/api/models/moves_model.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/api/models/sprites_model.dart';
import 'package:pokedex_async_redux/api/models/stat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';

part 'details_pokemon_model.freezed.dart';
part 'details_pokemon_model.g.dart';

@freezed
class DetailsPokemon with _$DetailsPokemon {
  factory DetailsPokemon({
    @JsonKey(name: 'abilities') List<Ability>? abilities,
    @JsonKey(name: 'base_experience') int? baseExperience,
    @JsonKey(name: 'forms') List<Species>? forms,
    @JsonKey(name: 'height') int? height,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'moves') List<Moves>? moves,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'species') Species? species,
    @JsonKey(name: 'sprites') Sprites? sprites,
    @JsonKey(name: 'stats') List<Stat>? stats,
    @JsonKey(name: 'types') List<SubType>? types,
    @JsonKey(name: 'weight') int? weight,
  }) = _DetailsPokemon;

  factory DetailsPokemon.fromJson(Map<String, dynamic> json) => _$DetailsPokemonFromJson(json);
}
