import 'package:pokedex_async_redux/api/models/pokemon_model.dart';

import 'package:flutter/material.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({this.pokemon});
  final Pokemon? pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Pokédex',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Scaffold(
          body: Center(
        child: Text(pokemon?.name ?? ''),
      )),
    );
  }
}
