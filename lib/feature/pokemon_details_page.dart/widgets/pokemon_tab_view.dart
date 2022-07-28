import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_about_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_base_stats_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_moves_tab.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class TabView extends StatelessWidget {
  const TabView({required this.pokemon});
  final DetailsPokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (pokemon.types?.first.type?.name ?? '').getPokemonColor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                indicatorColor: (pokemon.types?.first.type?.name ?? '').getPokemonColor,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      pokemonDetailsTabs[0],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                      child: Text(
                    pokemonDetailsTabs[1],
                    style: TextStyle(color: Colors.black),
                  )),
                  Tab(
                      child: Text(
                    pokemonDetailsTabs[2],
                    style: TextStyle(color: Colors.black),
                  )),
                  Tab(
                      child: Text(
                    pokemonDetailsTabs[3],
                    style: TextStyle(color: Colors.black),
                  )),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: <Widget>[
                  AboutTab(
                    weight: pokemon.weight!,
                    height: pokemon.height!,
                    abilities: pokemon.abilities,
                    baseExperience: pokemon.baseExperience!,
                  ),
                  BaseStats(stat: pokemon.stats!),
                  Container(color: Colors.white),
                  MovesTab(
                    moves: pokemon.moves,
                    color: (pokemon.types?.first.type?.name ?? '').getPokemonColor,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
