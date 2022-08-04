import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class PokemonEvolutionTabWidget extends StatelessWidget {
  const PokemonEvolutionTabWidget({
    required this.thisSpecies,
    Key? key,
  }) : super(key: key);
  final List<Species> thisSpecies;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: thisSpecies
          .map(
            (thisSpecie) => Column(
              children: [
                Image.network(
                  '$pokemonImgUrl${thisSpecie.id ?? ''}.png',
                  width: 50,
                  height: 50,
                ),
                Text('#${thisSpecie.id.toString().padLeft(3, '0')}'),
                Text(thisSpecie.name.toString().capitalize),
              ],
            ),
          )
          .toList(),
    );
  }
}
