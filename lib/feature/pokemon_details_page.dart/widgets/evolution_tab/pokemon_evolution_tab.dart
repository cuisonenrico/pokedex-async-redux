import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/models/evolution_chain_model.dart';
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
            Container(
              height: 80,
              width: 80,
              child: PokemonEvolutionWidget(thisSpecies: thisPokeEvo.evolutionOne),
            ),
            thisPokeEvo.evolutionTwo.isNotEmpty
                ? Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_right_outlined),
                  )
                : SizedBox(),
            Column(
              children: thisPokeEvo.evolutionTwo.map((evo2) => PokemonEvolutionWidget(thisSpecies: evo2)).toList(),
            ),
            thisPokeEvo.evolutionThree != null
                ? Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_right_outlined),
                  )
                : SizedBox(),
            thisPokeEvo.evolutionThree != null
                ? PokemonEvolutionWidget(thisSpecies: thisPokeEvo.evolutionThree)
                : Container()
          ],
        ),
      ),
    );
  }
}
