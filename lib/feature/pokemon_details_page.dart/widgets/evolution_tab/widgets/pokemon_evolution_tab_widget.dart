import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  const PokemonEvolutionWidget({
    required this.thisSpecies,
    required this.arrowCheck,
  });
  final List<Species> thisSpecies;
  final bool arrowCheck;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: thisSpecies
          .map(
            (thisSpecies) => Container(
              margin: arrowCheck ? EdgeInsets.fromLTRB(30, 0, 0, 0) : EdgeInsets.all(0),
              height: 80,
              width: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (arrowCheck)
                    Positioned(
                      left: -55,
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                  Image.network(
                    '$pokemonImgUrl${thisSpecies.id ?? ''}.png',
                    width: 50,
                    height: 50,
                  ),
                  Positioned(
                    bottom: 15,
                    left: 5,
                    child: Text('#${thisSpecies.id.toString().padLeft(3, '0')}'),
                  ),
                  Positioned(
                    bottom: 2,
                    left: 5,
                    child: Text('${thisSpecies.name.toString().capitalize}'),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
