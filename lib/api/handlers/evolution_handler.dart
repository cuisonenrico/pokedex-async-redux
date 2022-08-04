import 'dart:convert';

import 'package:pokedex_async_redux/api/models/evolution_chain_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_async_redux/api/models/species_model.dart';

class EvolutionHandler {
  static Future<EvolutionChain?> getEvolution(String? url) async {
    var response = http.Response('', 100);
    try {
      response = await http.get(Uri.tryParse(url ?? '') ?? Uri());
    } catch (e) {
      rethrow;
    }
    if (response.statusCode == 200) {
      final evolutionChain = jsonDecode(response.body);
      var evoChainResponse = await http.get(Uri.tryParse(evolutionChain['evolution_chain']['url']) ?? Uri());

      if (evoChainResponse.statusCode == 200) {
        final listEvolution = jsonDecode(evoChainResponse.body);
        List evolution2 = listEvolution['chain']['evolves_to'];
        var evolution3 = <Species>[];
        //Checks if there is 3rd evolution // adds to 'evolution3 'list
        if (evolution2.isNotEmpty) {
          for (var element in evolution2) {
            if (element['evolves_to'] != null) {
              List evloution2List = element['evolves_to'];
              for (var species in evloution2List) {
                evolution3.add(Species(
                  name: species['species']['name'],
                  id: species['species']['url'].split('/')[6],
                ));
              }
            }
          }
        }
        return EvolutionChain(
          evolutionOne: Species(
            name: listEvolution['chain']['species']['name'],
            id: listEvolution['chain']['species']['url'].toString().split('/')[6],
          ),
          evolutionTwo: evolution2.isNotEmpty
              ? evolution2
                  .map((e) => Species(
                        name: e['species']['name'],
                        id: e['species']['url'].toString().split('/')[6],
                      ))
                  .toList()
              : [],
          evolutionThree: evolution3,
        );
      }
    } else {
      return null;
    }
    return null;
  }
}
