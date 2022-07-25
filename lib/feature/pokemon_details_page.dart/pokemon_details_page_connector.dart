import 'package:async_redux/async_redux.dart';
import 'package:counter_async_redux/feature/pokemon_details_page.dart/pokemon_details_page.dart';
import 'package:counter_async_redux/feature/pokemon_details_page.dart/pokemon_details_page_vm.dart';
import 'package:counter_async_redux/feature/widgets/loading_widgets.dart';
import 'package:counter_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

import '../../state/actions/home_page_actions.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({this.url});
  final url;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
        vm: () => PokemonDetailsVmFactory(),
        onInit: (store) async => store.dispatch(GetPokemonDetails(url)),
        builder: (context, vm) {
          return vm.pokemonDetailsState.when(
            (pokemonDetails) => PokemonDetails(pokemon: pokemonDetails),
            loading: () => PokemonDetailsLoading(),
            error: (err) => Center(child: Text(err!)),
          );
        });
  }
}
