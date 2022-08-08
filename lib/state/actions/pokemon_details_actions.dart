import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/state/actions/actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utilities/app_starter.dart';

class GetPokemonDetailsAction extends LoadingAction {
  static const key = 'get_pokemon_details_key';
  GetPokemonDetailsAction(this.url) : super(actionKey: key);
  final String url;
  @override
  Future<AppState> reduce() async {
    final details = await getIt<ApiService>().detailsPokemonHandler.getDetails(url);
    return state.copyWith(pokemonDetails: details);
  }
}

class GetEvolutionAction extends LoadingAction {
  static const key = 'get_pokemon_evolution_key';
  GetEvolutionAction(this.url) : super(actionKey: key);
  final String? url;
  @override
  Future<AppState> reduce() async {
    final evolutionResponse = await getIt<ApiService>().evolutionHandler.getEvolution(url);
    return state.copyWith(evolution: evolutionResponse);
  }
}
