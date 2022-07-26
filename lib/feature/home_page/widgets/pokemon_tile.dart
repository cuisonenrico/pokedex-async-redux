import 'dart:convert';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/api/models/pokemon_type_model.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/pokemon_details_page_connector.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonTile extends StatefulWidget {
  const PokemonTile({
    required this.thisPokemon,
  });
  final Pokemon thisPokemon;

  @override
  _PokemonTileState createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  PokemonType? thisType;
  @override
  void initState() {
    http.get(Uri.tryParse('${widget.thisPokemon.url}') ?? Uri()).then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        setState(() {
          thisType = PokemonType.fromJson(result);
        });
      } else {
        print('error');
      }
    });
    super.initState();
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
              '${widget.thisPokemon.name?[0].toUpperCase()}${widget.thisPokemon.name?.substring(1).toLowerCase()}',
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
                    Text(
                        '${thisType?.subType?.first.specificType?.name ?? ''}'),
                    Text(
                        '${thisType?.subType?.last.specificType?.name == thisType?.subType?.first.specificType?.name ? '' : thisType?.subType?.last.specificType?.name}'),
                  ]),
                ),
                Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.centerRight,
                  child: Image.network(
                    '$pokemonImgUrl${thisType?.id}.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
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
            MaterialPageRoute(
                builder: (context) =>
                    PokemonDetailsConnector(url: widget.thisPokemon.url)));
      },
    );
  }
}
