import 'package:async_redux/async_redux.dart';
import 'package:counter_async_redux/api/models/detailsPokemon_model.dart';
import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:counter_async_redux/api/models/specificType_model.dart';
import 'package:counter_async_redux/feature/home_page/home_page_connector.dart';
import 'package:counter_async_redux/state/actions/home_page_actions.dart';
import 'package:counter_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

class HomePageVmFactory extends VmFactory<AppState, HomePageConnector> {
  @override
  Vm fromStore() {
    return HomePageVm(
      loadMore: _onIncrement,
      pokemon: state.pokemon,
      next: state.nextPage,
    );
  }

  void _onIncrement() {
    dispatch(GetPokemonList());
    dispatch(GetNextPage());
  }
}

class HomePageVm extends Vm {
  HomePageVm({
    required this.loadMore,
    required this.pokemon,
    required this.next,
  }) : super(equals: [
          pokemon,
          next,
        ]);

  final VoidCallback loadMore;
  final List<DetailsPokemon>? pokemon;
  final String? next;
}
