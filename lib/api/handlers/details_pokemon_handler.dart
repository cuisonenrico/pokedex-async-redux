import 'package:pokedex_async_redux/api/api_client.dart';
import 'package:pokedex_async_redux/api/models/ability_model.dart';
import 'package:pokedex_async_redux/api/models/detailed_stat_model.dart';
import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:pokedex_async_redux/api/models/move_model.dart';
import 'package:pokedex_async_redux/api/models/moves_model.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/api/models/specific_ability_model.dart';
import 'package:pokedex_async_redux/api/models/specific_type_model.dart';
import 'package:pokedex_async_redux/api/models/stat_model.dart';
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class DetailsPokemonHandler {
  DetailsPokemonHandler({required this.apiClient});
  final ApiClient apiClient;

  Future<DetailsPokemon?> getDetails(String id) async {
    final baseUri = Uri.parse(apiClient.dio.options.baseUrl);
    final uri = baseUri.replace(path: '${baseUri.path}$pokemonsPath$id');
    return apiClient.dio.getUri(uri).then((responsee) {
      List statMap = responsee.data['stats'];
      List typeMap = responsee.data['types'];
      List movesMap = responsee.data['moves'];
      List abilitiesMap = responsee.data['abilities'];
      var speciesMap = responsee.data['species'];
      return DetailsPokemon(
        id: responsee.data['id'],
        name: responsee.data['name'],
        baseExperience: responsee.data['base_experience'],
        height: responsee.data['height'],
        weight: responsee.data['weight'],
        species: Species(
          name: speciesMap['name'],
          url: speciesMap['url'],
        ),
        abilities: abilitiesMap
            .map((e) => Ability(
                  ability: SpecificAbility(
                    name: e['ability']['name'],
                    url: e['ability']['url'],
                  ),
                  slot: e['slot'],
                  isHidden: e['is_hidden'],
                ))
            .toList(),
        stats: statMap.map((e) {
          return Stat(
            baseStat: e['base_stat'],
            stat: DetailedStat(
              name: e['stat']['name'],
              url: e['stat']['url'],
            ),
            effort: e['effort'],
          );
        }).toList(),
        types: typeMap
            .map((e) => SubType(
                slot: e['slot'],
                type: SpecificType(
                  name: e['type']['name'],
                  url: e['type']['url'],
                )))
            .toList(),
        moves: movesMap
            .map((e) => Moves(
                  move: Move(
                    name: e['move']['name'],
                    url: e['move']['url'],
                  ),
                ))
            .toList(),
      );
    });
  }
}
