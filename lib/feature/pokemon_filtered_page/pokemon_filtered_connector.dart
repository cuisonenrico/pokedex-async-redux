import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/feature/pokemon_filtered_page/pokemon_filtered_page.dart';
import 'package:pokedex_async_redux/feature/pokemon_filtered_page/pokemon_filtered_vm.dart';
import 'package:pokedex_async_redux/feature/widgets/pokemon_list_loading_widget.dart';
import 'package:pokedex_async_redux/state/actions/home_page_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

class PokemonFilteredPageConnector extends StatelessWidget {
  const PokemonFilteredPageConnector({
    required this.filterKey,
    Key? key,
  }) : super(key: key);
  final String filterKey;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FilteredPageVm>(
      vm: () => FilteredPageVmFactory(),
      onInit: (store) async => store.dispatch(GetFilterListAction(filterKey: filterKey)),
      builder: (context, vm) {
        return vm.filteredPageState.when(
          (pokemonList) => PokemonFilteredPage(
            pokemon: pokemonList!,
            filterKey: vm.filterKey,
          ),
          loading: () => const PokemonListLoading(),
          error: (err) => Center(child: Text(err!)),
        );
      },
    );
  }
}
