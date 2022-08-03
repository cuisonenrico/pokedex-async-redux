import 'package:pokedex_async_redux/api/models/ability_model.dart';
import 'package:pokedex_async_redux/api/models/game_index_model.dart';
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
    List<Ability>? abilities,
    int? baseExperience,
    List<Species>? forms,
    List<GameIndex>? gameIndices,
    int? height,
    int? id,
    bool? isDefault,
    List<Moves>? moves,
    String? name,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<SubType>? types,
    int? weight,
  }) = _DetailsPokemon;

  factory DetailsPokemon.fromJson(Map<String, dynamic> json) => _$DetailsPokemonFromJson(json);
}
