import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_abilities_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_about_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_base_stats_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_moves_tab.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({this.pokemon});
  final DetailsPokemon? pokemon;
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
        body: Column(
          children: [
            Container(
              width: 170,
              height: 200,
              child: Column(
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    child: Image.network(
                      '$pokemonImgUrl${pokemon?.id}.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                  Text(
                    '${pokemon?.name?[0].toUpperCase()}${pokemon?.name!.substring(1).toLowerCase()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 4,
              child: SizedBox(
                height: 400,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            'ABOUT',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Tab(
                            child: Text(
                          'STATS',
                          style: TextStyle(color: Colors.black),
                        )),
                        Tab(
                            child: Text(
                          'ABILITIES',
                          style: TextStyle(color: Colors.black),
                        )),
                        Tab(
                            child: Text(
                          'MOVES',
                          style: TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          AboutTab(pokemon: pokemon),
                          BaseStats(stat: pokemon?.stats),
                          //Change into Evolution
                          Abilities(abilities: pokemon?.abilities),
                          MovesTab(moves: pokemon?.moves),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
