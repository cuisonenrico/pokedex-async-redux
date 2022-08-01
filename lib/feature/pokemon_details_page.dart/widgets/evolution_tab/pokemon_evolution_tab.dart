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
        child: Center(
          child: Wrap(
            children: [
              PokemonEvolutionTabWidget(thisSpecies: <Species>[thisPokeEvo.evolutionOne!]),
              if (thisPokeEvo.evolutionTwo.isNotEmpty)
                Container(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.arrow_right_outlined),
                ),
              PokemonEvolutionTabWidget(thisSpecies: thisPokeEvo.evolutionTwo),
              if (thisPokeEvo.evolutionThree.isNotEmpty)
                Container(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.arrow_right_outlined),
                ),
              PokemonEvolutionTabWidget(thisSpecies: thisPokeEvo.evolutionThree),
            ],
          ),
        ),
      ),
    );
  }
}
