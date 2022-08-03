import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/pokemon_tile.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class PokemonFilteredPage extends StatelessWidget {
  const PokemonFilteredPage({
    required this.pokemon,
    required this.filterKey,
  });

  final List<Pokemon> pokemon;
  final String filterKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackButton(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              filterKey.capitalize,
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          SliverFillRemaining(
              child: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 3 / 2,
              children: pokemon
                  .map((e) => PokemonTile(
                        key: UniqueKey(),
                        thisPokemon: e,
                      ))
                  .toList(),
            ),
          ))
        ],
      ),
    );
  }
}
