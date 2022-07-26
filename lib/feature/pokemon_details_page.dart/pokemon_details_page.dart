import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({this.pokemon});
  final Pokemon? pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: BackButton(color: Colors.black),
            title: Text(
              titleHeader,
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            actions: [],
          ),
        ],
      ),
    );
  }
}
