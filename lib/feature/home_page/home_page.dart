import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:counter_async_redux/feature/home_page/widgets/pokemon_tile.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.getPokemon,
    required this.pokemon,
    this.next,
  });

  final Function(bool? isScrolling) getPokemon;
  final List<Pokemon> pokemon;
  final String? next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Pokédex', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: Center(
                child: TextField(
                  onChanged: (query) async {},
                  showCursor: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              final currentScroll = scrollInfo.metrics.pixels;
              final maxScroll = scrollInfo.metrics.maxScrollExtent - 500;
              if (currentScroll >= maxScroll) {
                getPokemon(true);
              }
              return false;
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: pokemon.length,
                itemBuilder: (context, index) {
                  return PokemonTile(
                    thisPokemon: pokemon[index],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
