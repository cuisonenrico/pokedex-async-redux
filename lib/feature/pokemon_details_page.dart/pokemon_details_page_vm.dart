import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:pokedex_async_redux/feature/home_page/home_page_connector.dart';
import 'package:pokedex_async_redux/models/union_page_state.dart';
import 'package:pokedex_async_redux/state/actions/home_page_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class PokemonDetailsVmFactory extends VmFactory<AppState, HomePageConnector> {
  @override
  Vm fromStore() {
    return PokemonDetailsVm(pokemonDetailsState: _getPageState());
  }

  UnionPageState<DetailsPokemon?> _getPageState() {
    if (state.wait.isWaitingFor(GetPokemonDetails.key)) {
      return UnionPageState.loading();
    } else if (state.pokemonDetails?.id != null) {
      return UnionPageState(state.pokemonDetails);
    } else {
      return UnionPageState.error("Can't load details");
    }
  }
}

class PokemonDetailsVm extends Vm {
  PokemonDetailsVm({required this.pokemonDetailsState}) : super(equals: [pokemonDetailsState]);
  final UnionPageState<DetailsPokemon?> pokemonDetailsState;
}
