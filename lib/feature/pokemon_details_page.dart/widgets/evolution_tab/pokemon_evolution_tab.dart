import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/models/evolution_chain_model.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/evolution_tab/widgets/pokemon_evolution_tab_widget.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({required this.thisPokeEvo});
  final EvolutionChain thisPokeEvo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            PokemonEvolutionWidget(
              thisSpecies: <Species>[thisPokeEvo.evolutionOne!],
              arrowCheck: false,
            ),
            PokemonEvolutionWidget(
              thisSpecies: thisPokeEvo.evolutionTwo,
              arrowCheck: true,
            ),
            PokemonEvolutionWidget(
              thisSpecies: thisPokeEvo.evolutionThree,
              arrowCheck: true,
            ),
          ],
        ),
      ),
    );
  }
}
