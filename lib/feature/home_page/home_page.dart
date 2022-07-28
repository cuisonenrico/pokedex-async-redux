import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/pokemon_tile.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/doubles.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.getPokemon,
    this.pokemon,
  });

  final Function(bool? isScrolling) getPokemon;
  final List<Pokemon>? pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          titleHeader,
          style: TextStyle(
            color: Colors.black,
            fontSize: headerSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black,
            tooltip: 'Search Icon',
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          final currentScroll = scrollInfo.metrics.pixels;
          final maxScroll = scrollInfo.metrics.maxScrollExtent - scrollExtentOffset;
          if (currentScroll >= maxScroll) {
            getPokemon(true);
          }
          return false;
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: pokemon?.length ?? 0,
            itemBuilder: (context, index) => PokemonTile(thisPokemon: pokemon![index]),
          ),
        ),
      ),
    );
  }
}
