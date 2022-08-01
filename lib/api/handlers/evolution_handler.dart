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
      print(e);
    }
    if (response.statusCode == 200) {
      final evolutionChain = jsonDecode(response.body);
      var evoChainResponse = await http.get(Uri.tryParse(evolutionChain['evolution_chain']['url']) ?? Uri());

      if (evoChainResponse.statusCode == 200) {
        final listEvolution = jsonDecode(evoChainResponse.body);
        List evolutionList = listEvolution['chain']['evolves_to'];
        var evo3;
        //checks if there is 3rd evolution
        if (evolutionList.isNotEmpty) {
          evolutionList.forEach((element) {
            if (element['evolves_to'] != null) {
              List checkList2 = element['evolves_to'];
              checkList2.forEach((species) {
                evo3 = Species(
                  name: species['species']['name'],
                  id: species['species']['url'].split('/')[6],
                );
              });
            }
          });
        }
        return EvolutionChain(
          evolutionOne: Species(
            name: listEvolution['chain']['species']['name'],
            id: listEvolution['chain']['species']['url'].toString().split('/')[6],
          ),
          evolutionTwo: evolutionList.isNotEmpty
              ? evolutionList
                  .map((e) => Species(
                        name: e['species']['name'],
                        id: e['species']['url'].toString().split('/')[6],
                      ))
                  .toList()
              : [],
          evolutionThree: evo3,
        );
      }
    } else {
      print('error');
      return null;
    }
    return null;
  }
}
