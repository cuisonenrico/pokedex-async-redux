import 'package:async_redux/async_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/evolution_tab/pokemon_evolution_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/evolution_tab/pokemon_evultion_tab_vm.dart';
import 'package:pokedex_async_redux/state/actions/pokemon_details_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

class PokemonEvolutionConnector extends StatelessWidget {
  const PokemonEvolutionConnector({
    this.id,
    Key? key,
  }) : super(key: key);
  final String? id;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonEvolutionVm>(
        vm: () => PokemonEvolutionVmFactory(),
        onInit: (store) async => store.dispatch(GetEvolutionAction(id)),
        builder: (context, vm) {
          return vm.evolutionState.when(
            (value) => EvolutionTab(thisPokeEvo: value!),
            loading: () => const SpinKitSpinningLines(color: Colors.black),
            error: (err) => Text(err.toString()),
          );
        });
  }
}
