import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/api/models/evolution_chain_model.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/evolution_tab/pokemon_evolution_tab_connector.dart';
import 'package:pokedex_async_redux/models/union_page_state.dart';
import 'package:pokedex_async_redux/state/actions/home_page_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class PokemonEvolutionVmFactory extends VmFactory<AppState, PokemonEvolutionConnector> {
  @override
  Vm fromStore() => PokemonEvolutionVm(evolutionState: _getPageState());

  UnionPageState<EvolutionChain?> _getPageState() {
    if (state.wait.isWaitingFor(GetEvolution.key)) {
      return UnionPageState.loading();
    } else if (state.evolution != null) {
      return UnionPageState(state.evolution);
    } else {
      return UnionPageState.error("Can't load details");
    }
  }
}

class PokemonEvolutionVm extends Vm {
  PokemonEvolutionVm({required this.evolutionState}) : super(equals: [evolutionState]);
  final UnionPageState<EvolutionChain?> evolutionState;
}
