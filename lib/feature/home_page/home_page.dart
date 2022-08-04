import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/pokemon_search_page.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/filter_bottom_sheet_connector.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/pokemon_tile.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/doubles.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final List<Pokemon> pokemon;

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
            onPressed: () => showSearch(context: context, delegate: PokemonSearchPage(pokemonList: pokemon)),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 55, 153, 218),
        onPressed: () => showModalBottomSheet(
          anchorPoint: const Offset(10, 2000),
          constraints: const BoxConstraints(maxHeight: 250, maxWidth: 380),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.fromLTRB(15, 2, 15, 0),
              child: const FilterBottomSheetConnector(),
            );
          },
        ),
        child: const Icon(Icons.filter_list),
      ),
    );
  }
}
