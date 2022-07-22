import 'dart:async';
import 'package:counter_async_redux/api/handlers/pokemon_handler.dart';
import 'package:counter_async_redux/api/handlers/detailsPokemon_handler.dart';
import 'package:counter_async_redux/state/actions/actions.dart';
import 'package:counter_async_redux/state/app_state.dart';

class GetPokemonList extends LoadingAction {
  final isScrolling;
  static const key = 'get_pokemon_list_key';
  GetPokemonList({
    this.isScrolling = false,
  }) : super(actionKey: isScrolling ? null : key);
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

/* Updates list with PokemonDetails */
class GetPokemonDetails extends LoadingAction {
  final String url;
  GetPokemonDetails(this.url) : super(actionKey: url);
  @override
  Future<AppState> reduce() async {
    final details = await DetailsPokemonHandler.getDetails(url);
    final modifiedPokemons = state.pokemon
        .map((pokemon) => pokemon.url == url
            ? pokemon.copyWith(detailsPokemon: details)
            : pokemon)
        .toList();
    return state.copyWith(pokemon: modifiedPokemons);
  }
}
