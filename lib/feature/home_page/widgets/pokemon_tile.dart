import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/pokemon_details_page_connector.dart';
import 'package:pokedex_async_redux/feature/widgets/pill_container_widget.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PokemonTile extends StatefulWidget {
  const PokemonTile({
    required this.thisPokemon,
    Key? key,
  }) : super(key: key);
  final Pokemon thisPokemon;

  @override
  PokemonTileState createState() => PokemonTileState();
}

class PokemonTileState extends State<PokemonTile> {
  DetailsPokemon? thisPokemonDetails;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      thisPokemonDetails = await ApiService().detailsPokemonHandler.getDetails(widget.thisPokemon.url ?? '');
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              thisPokemonDetails?.types?.first.type?.name?.getPokemonColor ?? const Color.fromARGB(179, 158, 158, 158),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(
                '$pokemonImgUrl${thisPokemonDetails?.id}.png',
                width: 120,
                height: 120,
                errorBuilder: (_, __, ___) => const SpinKitSpinningLines(color: Colors.white),
              ),
            ),
            Positioned(
              left: 5,
              top: 5,
              child: Text(
                widget.thisPokemon.name?.capitalize ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: thisPokemonDetails?.types
                        ?.map((e) => Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: PillContainerWidget(
                                text: e.type!.name,
                                color: typeDetailsPageBackgroundColor,
                              ),
                            ))
                        .toList() ??
                    [],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PokemonDetailsConnector(url: widget.thisPokemon.url!)),
        );
      },
    );
  }
}
