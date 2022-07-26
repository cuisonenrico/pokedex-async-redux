import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_base_stats_tab.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({required this.pokemon});
  final DetailsPokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: BackButton(color: Colors.black),
            backgroundColor: Colors.white, // TODO: Make dynamic later
            actions: [],
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
                color: Colors.white, // TODO: Make dynamic later
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Text(
                                '${pokemon.name?[0].toUpperCase()}${pokemon.name?.substring(1).toLowerCase()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: Text(
                                    '#${pokemon.id.toString().padLeft(3, '0')}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey, // TODO: Make dynamic later
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                      child: Text(
                                        '${pokemon.types?.first.type?.name ?? ''}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: pokemon.types?.last.type?.name == pokemon.types?.first.type?.name
                                        ? false
                                        : true,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey, // change color later
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                        child: Text(
                                          '${pokemon.types?.last.type?.name == pokemon.types?.first.type?.name ? '' : pokemon.types?.last.type?.name}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        child: Image.network(
                          '$pokemonImgUrl${pokemon.id}.png',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: DefaultTabController(
                          length: 4,
                          child: SizedBox(
                            height: 400,
                            child: Column(
                              children: <Widget>[
                                TabBar(
                                  tabs: <Widget>[
                                    Tab(
                                      child: Text(
                                        pokemonDetailsTabs[0],
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Tab(
                                        child: Text(
                                      pokemonDetailsTabs[1],
                                      style: TextStyle(color: Colors.black),
                                    )),
                                    Tab(
                                        child: Text(
                                      pokemonDetailsTabs[2],
                                      style: TextStyle(color: Colors.black),
                                    )),
                                    Tab(
                                        child: Text(
                                      pokemonDetailsTabs[3],
                                      style: TextStyle(color: Colors.black),
                                    )),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: <Widget>[
                                      Container(color: Colors.amberAccent),
                                      BaseStats(stat: pokemon.stats!),
                                      Container(color: Colors.amberAccent),
                                      Container(color: Colors.amberAccent),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
