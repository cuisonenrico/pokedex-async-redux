import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/models/evolution_chain_model.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

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
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Image.network(
                      '$pokemonImgUrl${thisPokeEvo.evolutionOne?.id}.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 5,
                    child: Text('#${thisPokeEvo.evolutionOne?.id.toString().padLeft(3, '0')}'),
                  ),
                  Positioned(
                    bottom: 2,
                    left: 5,
                    child: Text('${thisPokeEvo.evolutionOne?.name.toString().capitalize ?? ''}'),
                  )
                ],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              child: Icon(Icons.arrow_right_outlined),
            ),
            Column(
              children: thisPokeEvo.evolutionTwo
                  .map(
                    (e) => Container(
                      height: 80,
                      width: 80,
                      child: Stack(
                        children: [
                          Image.network(
                            '$pokemonImgUrl${e.id}.png',
                            width: 50,
                            height: 50,
                          ),
                          Positioned(
                            bottom: 15,
                            left: 5,
                            child: Text('#${e.id.toString().padLeft(3, '0')}'),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 5,
                            child: Text('${e.name.toString().capitalize}'),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            thisPokeEvo.evolutionThree != null
                ? Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_right_outlined),
                  )
                : SizedBox(),
            thisPokeEvo.evolutionThree != null
                ? Container(
                    height: 80,
                    width: 80,
                    child: Stack(
                      children: [
                        Image.network(
                          '$pokemonImgUrl${thisPokeEvo.evolutionThree?.id}.png',
                          width: 50,
                          height: 50,
                        ),
                        Positioned(
                          bottom: 15,
                          left: 5,
                          child: Text('#${thisPokeEvo.evolutionThree?.id.toString().padLeft(3, '0')}'),
                        ),
                        Positioned(
                          bottom: 2,
                          left: 5,
                          child: Text('${thisPokeEvo.evolutionThree?.name.toString().capitalize}'),
                        )
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
