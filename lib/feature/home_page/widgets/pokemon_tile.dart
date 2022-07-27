import 'dart:convert';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/api/models/pokemon_type_model.dart';
import 'package:pokedex_async_redux/api/models/specific_type_model.dart';
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/pokemon_details_page_connector.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      http.get(Uri.tryParse('${widget.thisPokemon.url}') ?? Uri()).then((value) {
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
                ))).toList(),
          );
          if (mounted) {
            setState(() {});
          }
        } else {
          print('error');
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(children: [
            const SizedBox(height: 8),
            Text(
              widget.thisPokemon.name?.capitalize ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                  child: Column(children: [
                    Text('${thisTileTypes?.subTypes?.first.type?.name ?? ''}'),
                    Text(
                        '${thisTileTypes?.subTypes?.last.type?.name == thisTileTypes?.subTypes?.first.type?.name ? '' : thisTileTypes?.subTypes?.last.type?.name}'),
                  ]),
                ),
                Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.centerRight,
                  child: Image.network(
                    '$pokemonImgUrl${thisTileTypes?.id}.png',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return CircularProgressIndicator();
                    },
                  ),
                )
              ],
            ),
          ]),
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
