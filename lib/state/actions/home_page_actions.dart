import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:counter_async_redux/api/handlers/pokemon_handler.dart';
import 'package:counter_async_redux/api/handlers/detailsPokemon_handler.dart';
import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:counter_async_redux/state/app_state.dart';
import 'package:counter_async_redux/utilities/constants.dart';

class GetPokemonList extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final currentList = state.pokemon;
    //  final pokemon = await PokemonHandler.getPokemons(state.nextPage);

    final pokemonAdd = await DetailsPokemonHandler.getDetails(state.nextPage);

    return state.copyWith(pokemon: currentList! + pokemonAdd!);
  }
}

class GetNextPage extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final next = await PokemonHandler.getNextPage(state.nextPage);
    return state.copyWith(nextPage: next);
  }
}
