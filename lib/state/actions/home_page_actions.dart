import 'dart:async';
import 'package:pokedex_async_redux/api/handlers/details_pokemon_handler.dart';
import 'package:pokedex_async_redux/api/handlers/pokemon_handler.dart';
import 'package:pokedex_async_redux/api/handlers/pokemon_type_handler.dart';
import 'package:pokedex_async_redux/state/actions/actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class GetPokemonList extends LoadingAction {
  static const key = 'get_pokemon_list_key';
  GetPokemonList({
    this.isScrolling = false,
  }) : super(actionKey: isScrolling ? null : key);
  final isScrolling;
  @override
  Future<AppState> reduce() async {
    final currentList = state.pokemon;
    final pokemonResponse = await PokemonHandler.getPokemons(state.nextPage);
    return state.copyWith(
      pokemon: [...currentList, ...pokemonResponse?.result ?? []],
      nextPage: pokemonResponse?.next,
    );
  }
}

class GetPokemonDetails extends LoadingAction {
  static const key = 'get_pokemon_details_key';
  GetPokemonDetails(this.url) : super(actionKey: key);
  final url;
  @override
  Future<AppState> reduce() async {
    final details = await DetailsPokemonHandler.getDetails(url);
    return state.copyWith(pokemonDetails: details);
  }
}

// class GetPokemonType extends LoadingAction {
//   static const key = 'get_pokemon_type_key';
//   GetPokemonType(this.url, this.index) : super(actionKey: url);
//   final url;
//   final index;
//   @override
//   Future<AppState> reduce() async {
//     final types = await PokemonTypeHandler.getTypes(url);
//     return state.copyWith(pokemon: details);
//   }
// }
