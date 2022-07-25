import 'package:async_redux/async_redux.dart';
import 'package:counter_async_redux/feature/home_page/home_page.dart';
import 'package:counter_async_redux/feature/home_page/home_page_vm.dart';
import 'package:counter_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

import '../../state/actions/home_page_actions.dart';

class HomePageConnector extends StatelessWidget {
  const HomePageConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVm>(
        vm: () => HomePageVmFactory(),
        onInit: (store) async => store.dispatch(GetPokemonList()),
        builder: (context, vm) {
          return vm.homePageState.when(
            (pokemonList) => HomePage(
              getPokemon: vm.getPokemon,
              pokemon: pokemonList!,
            ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err) => Center(child: Text(err!)),
          );
        });
  }
}
