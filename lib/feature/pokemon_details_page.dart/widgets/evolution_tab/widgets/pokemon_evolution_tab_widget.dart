import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  const PokemonEvolutionWidget({this.thisSpecies});
  final Species? thisSpecies;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Image.network(
            '$pokemonImgUrl${thisSpecies?.id ?? ''}.png',
            width: 50,
            height: 50,
          ),
          Positioned(
            bottom: 15,
            left: 5,
            child: Text('#${thisSpecies?.id.toString().padLeft(3, '0') ?? ''}'),
          ),
          Positioned(
            bottom: 2,
            left: 5,
            child: Text('${thisSpecies?.name.toString().capitalize ?? ''}'),
          )
        ],
      ),
    );
  }
}
