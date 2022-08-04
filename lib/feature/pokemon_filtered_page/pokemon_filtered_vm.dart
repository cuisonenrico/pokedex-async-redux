import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/feature/pokemon_filtered_page/pokemon_filtered_connector.dart';
import 'package:pokedex_async_redux/models/union_page_state.dart';
import 'package:pokedex_async_redux/state/actions/home_page_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class FilteredPageVmFactory extends VmFactory<AppState, PokemonFilteredPageConnector> {
  @override
  Vm fromStore() => FilteredPageVm(filteredPageState: _getPageState(), filterKey: state.filterKey);

  UnionPageState<List<Pokemon>> _getPageState() {
    if (state.wait.isWaitingFor(GetFilterListAction.key)) {
      return const UnionPageState.loading();
    } else if (state.filteredPokemons.isNotEmpty) {
      return UnionPageState(state.filteredPokemons);
    } else {
      return const UnionPageState.error("Can't load filtered pokemons");
    }
  }
}

class FilteredPageVm extends Vm {
  FilteredPageVm({
    required this.filteredPageState,
    required this.filterKey,
  }) : super(equals: [
          filteredPageState,
          filterKey,
        ]);

  final UnionPageState<List<Pokemon>> filteredPageState;
  final String filterKey;
}
