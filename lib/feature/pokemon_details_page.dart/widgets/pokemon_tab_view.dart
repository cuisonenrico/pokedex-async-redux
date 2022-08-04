import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/evolution_tab/pokemon_evolution_tab_connector.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_about_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_base_stats_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_moves_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_info_tabs.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class PokemonTabView extends StatelessWidget {
  const PokemonTabView({
    required this.pokemonDetails,
    Key? key,
  }) : super(key: key);
  final DetailsPokemon pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (pokemonDetails.types?.first.type?.name ?? '').getPokemonColor,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                indicatorColor: (pokemonDetails.types?.first.type?.name ?? '').getPokemonColor,
                tabs: pokemonDetailsTabs.map((tab) => PokemonInfoTabs(tabTitle: tab)).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    AboutTab(
                      weight: pokemonDetails.weight ?? 0,
                      height: pokemonDetails.height ?? 0,
                      abilities: pokemonDetails.abilities ?? [],
                      baseExperience: pokemonDetails.baseExperience ?? 0,
                    ),
                    BaseStats(stat: pokemonDetails.stats),
                    PokemonEvolutionConnector(url: pokemonDetails.species?.id),
                    MovesTab(
                      moves: pokemonDetails.moves,
                      color: (pokemonDetails.types?.first.type?.name ?? '').getPokemonColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
