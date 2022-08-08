import 'dart:async';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/state/actions/actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utilities/app_starter.dart';

class GetPokemonListAction extends LoadingAction {
  static const key = 'get_pokemon_list_key';
  GetPokemonListAction() : super(actionKey: key);
  @override
  Future<AppState> reduce() async {
    final pokemonResponse = await getIt<ApiService>().pokemonHandler.getPokemons();
    return state.copyWith(pokemon: pokemonResponse ?? []);
  }
}
