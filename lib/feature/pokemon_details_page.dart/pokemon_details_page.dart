import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_about_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_base_stats_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_moves_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_tab_view.dart';
import 'package:pokedex_async_redux/feature/widgets/pill_container_widget.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({required this.pokemon});
  final DetailsPokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: (pokemon.types?.first.type?.name ?? '').getPokemonColor,
        elevation: 0,
        actions: [],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: (pokemon.types?.first.type?.name ?? '').getPokemonColor,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  pokemon.name?.capitalize ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  children: [
                    PillContainerWidget(
                      type: pokemon.types!.first.type!.name!,
                      color: typeDetailsPageBackgroundColor,
                    ),
                    Visibility(
                      visible: pokemon.types?.last.type?.name != pokemon.types?.first.type?.name,
                      child: PillContainerWidget(
                        type: pokemon.types!.last.type!.name!,
                        color: typeDetailsPageBackgroundColor,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 220,
                child: Image.network(
                  '$pokemonImgUrl${pokemon.id}.png',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return CircularProgressIndicator();
                  },
                ),
              )
            ]),
          ),
          Expanded(child: TabView(pokemon: pokemon))
        ],
      ),
    );
  }
}
