import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/pokemon_tile.dart';

class PokemonSearchPage extends SearchDelegate {
  PokemonSearchPage({required this.pokemonList});
  final List<Pokemon> pokemonList;
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(icon: Icon(Icons.clear), onPressed: () => query = ''),
      ];

  @override
  Widget? buildLeading(BuildContext context) => null;

  @override
  Widget buildResults(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 3 / 2,
          children: pokemonList
              .where((element) => element.name!.startsWith(query))
              .map((queried) => PokemonTile(
                    thisPokemon: queried,
                    key: UniqueKey(),
                  ))
              .toList(),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestions = <Pokemon>[];
    if (query.isNotEmpty) {
      suggestions = pokemonList.where((element) => element.name!.contains(query)).map((queried) => queried).toList();
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 3 / 2,
        children: suggestions
            .where((element) => element.name!.contains(query))
            .map((queried) => PokemonTile(
                  thisPokemon: queried,
                  key: UniqueKey(),
                ))
            .toList(),
      ),
    );
  }
}
