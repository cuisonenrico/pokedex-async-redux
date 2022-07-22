import 'package:counter_async_redux/api/models/pokemon_model.dart';

import 'package:flutter/material.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({this.pokemon});

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          body: Center(
        child: Text('${pokemon?.name}'),
      )),
    );
  }
}
