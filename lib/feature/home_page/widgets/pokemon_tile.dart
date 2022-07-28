import 'dart:convert';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/api/models/pokemon_type_model.dart';
import 'package:pokedex_async_redux/api/models/specific_type_model.dart';
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/pokemon_details_page_connector.dart';
import 'package:pokedex_async_redux/feature/widgets/pill_container_widget.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_async_redux/utilities/extensions.dart';

class PokemonTile extends StatefulWidget {
  const PokemonTile({required this.thisPokemon});
  final Pokemon thisPokemon;

  @override
  _PokemonTileState createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  PokemonType? thisTileTypes = PokemonType();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await http.get(Uri.tryParse('${widget.thisPokemon.url}') ?? Uri()).then((value) {
        if (value.statusCode == 200) {
          var result = jsonDecode(value.body);
          List SubTypeMap = result['types'];
          thisTileTypes = PokemonType(
            id: result['id'],
            subTypes: SubTypeMap.map((e) => SubType(
                  slot: result['slot'],
                  type: SpecificType(
                    name: e['type']['name'],
                    url: e['type']['url'],
                  ),
                )).toList(),
          );
        } else {
          print('error');
        }
      });
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
          color: thisTileTypes?.subTypes?.first.type?.name!.getPokemonColor ?? Colors.white,
        ),
        child: Column(children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    widget.thisPokemon.name?.capitalize ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                      child: PillContainerWidget(
                        type: thisTileTypes?.subTypes?.first.type?.name,
                        color: typeDetailsPageBackgroundColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                      child: Visibility(
                        visible: thisTileTypes?.subTypes?.last.type?.name != thisTileTypes?.subTypes?.first.type?.name,
                        child: PillContainerWidget(
                          type: thisTileTypes?.subTypes?.last.type?.name ?? '',
                          color: typeDetailsPageBackgroundColor,
                        ),
                      ),
                    )
                  ]),
                  Container(
                    child: Image.network(
                      '$pokemonImgUrl${thisTileTypes?.id}.png',
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
        ]),
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
