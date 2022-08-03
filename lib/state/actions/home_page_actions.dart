import 'dart:async';
import 'package:pokedex_async_redux/api/handlers/details_pokemon_handler.dart';
import 'package:pokedex_async_redux/api/handlers/evolution_handler.dart';
import 'package:pokedex_async_redux/api/handlers/pokemon_handler.dart';
import 'package:pokedex_async_redux/state/actions/actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class GetPokemonList extends LoadingAction {
  static const key = 'get_pokemon_list_key';
  GetPokemonList() : super(actionKey: key);
  @override
  Future<AppState> reduce() async {
    final pokemonResponse = await PokemonHandler.getPokemons();
    return state.copyWith(pokemon: pokemonResponse ?? []);
  }
}

class GetPokemonDetails extends LoadingAction {
  static const key = 'get_pokemon_details_key';
  GetPokemonDetails(this.url) : super(actionKey: key);
  final String url;
  @override
  Future<AppState> reduce() async {
    final details = await DetailsPokemonHandler.getDetails(url);
    return state.copyWith(pokemonDetails: details);
  }
}

class GetEvolution extends LoadingAction {
  static const key = 'get_pokemon_evolution_key';
  GetEvolution(this.url) : super(actionKey: key);
  final String? url;
  @override
  Future<AppState> reduce() async {
    final evolutionResponse = await EvolutionHandler.getEvolution(url);
    return state.copyWith(evolution: evolutionResponse);
  }
}

class GetFilterList extends LoadingAction {
  static const key = 'get_filtered_list_key';
  GetFilterList({required this.filterKey}) : super(actionKey: key);
  final String filterKey;
  @override
  Future<AppState> reduce() async {
    final filteredRes = await PokemonHandler.getFiltered(filterKey);
    return state.copyWith(filteredPokemons: filteredRes!, filterKey: filterKey);
  }
}
