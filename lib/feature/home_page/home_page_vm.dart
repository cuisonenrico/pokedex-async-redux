import 'package:async_redux/async_redux.dart';
import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:counter_async_redux/feature/home_page/home_page_connector.dart';
import 'package:counter_async_redux/models/union_page_state.dart';
import 'package:counter_async_redux/state/actions/home_page_actions.dart';
import 'package:counter_async_redux/state/app_state.dart';

class HomePageVmFactory extends VmFactory<AppState, HomePageConnector> {
  @override
  Vm fromStore() {
    return HomePageVm(
      getPokemon: _getPokemon,
      homePageState: _getPageState(),
    );
  }

  UnionPageState<List<Pokemon>> _getPageState() {
    if (state.wait.isWaitingFor(GetPokemonList.key)) {
      return UnionPageState.loading();
    } else if (state.pokemon.isNotEmpty) {
      return UnionPageState(state.pokemon);
    } else {
      return UnionPageState.error("Can't load Pokemons");
    }
  }

  void _getPokemon(bool? isScrolling) {
    dispatch(GetPokemonList(isScrolling: isScrolling));
  }
}

class HomePageVm extends Vm {
  HomePageVm({
    required this.getPokemon,
    required this.homePageState,
  }) : super(equals: [homePageState]);

  final Function(bool? isScrolling) getPokemon;
  final UnionPageState<List<Pokemon>> homePageState;
}
