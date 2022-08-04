import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/models/evolution_chain_model.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/evolution_tab/widgets/pokemon_evolution_tab_widget.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({
    required this.thisPokeEvo,
    Key? key,
  }) : super(key: key);
  final EvolutionChain thisPokeEvo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            PokemonEvolutionTabWidget(thisSpecies: <Species>[thisPokeEvo.evolutionOne!]),
            if (thisPokeEvo.evolutionTwo.isNotEmpty) ...[
              const Icon(Icons.arrow_right_outlined),
              PokemonEvolutionTabWidget(thisSpecies: thisPokeEvo.evolutionTwo),
            ],
            if (thisPokeEvo.evolutionThree.isNotEmpty) ...[
              const Icon(Icons.arrow_right_outlined),
              PokemonEvolutionTabWidget(thisSpecies: thisPokeEvo.evolutionThree),
            ],
          ],
        ),
      ),
    );
  }
}
