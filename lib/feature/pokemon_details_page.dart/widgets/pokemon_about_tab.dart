import 'package:counter_async_redux/api/models/details_pokemon_model.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({required this.pokemon});
  final DetailsPokemon? pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(children: [
            Text(
                '${pokemon?.forms?.last.name?[0].toUpperCase()}${pokemon?.forms?.last.name?.substring(1).toLowerCase()} is a ${pokemon?.types?.first.type?.name} type pokemon'),
          ]),
        ),
      ),
    );
  }
}
