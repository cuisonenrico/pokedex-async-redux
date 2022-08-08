import 'package:pokedex_async_redux/api/api_client.dart';
import 'package:pokedex_async_redux/api/models/evolution_chain_model.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class EvolutionHandler {
  EvolutionHandler({required this.apiClient});
  final ApiClient apiClient;
  Future<EvolutionChain?> getEvolution(String? id) async {
    final baseUri = Uri.parse(apiClient.dio.options.baseUrl);
    final uri = baseUri.replace(path: '${baseUri.path}$pokemonsSpeciesPath$id/');
    return apiClient.dio.getUri(uri).then(
      (response) {
        final evolutionChainUri = baseUri.replace(
            path:
                '${baseUri.path}$pokemonEvolutionChainPath/${response.data['evolution_chain']['url'].toString().parseId}');
        return apiClient.dio.getUri(evolutionChainUri).then((evoChainResponse) {
          final listEvolution = evoChainResponse;
          List evolution2 = listEvolution.data['chain']['evolves_to'];
          var evolution3 = <Species>[];
          //Checks if there is 3rd evolution // adds to 'evolution3 'list
          if (evolution2.isNotEmpty) {
            for (var element in evolution2) {
              if (element['evolves_to'] != null) {
                List evloution2List = element['evolves_to'];
                for (var species in evloution2List) {
                  evolution3.add(Species(
                    name: species['species']['name'],
                    url: species['species']['url'].toString().parseId,
                  ));
                }
              }
            }
          }
          return EvolutionChain(
            evolutionOne: Species(
              name: listEvolution.data['chain']['species']['name'],
              url: listEvolution.data['chain']['species']['url'].toString().parseId,
            ),
            evolutionTwo: evolution2.isNotEmpty
                ? evolution2
                    .map((e) => Species(
                          name: e['species']['name'],
                          url: e['species']['url'].toString().parseId,
                        ))
                    .toList()
                : [],
            evolutionThree: evolution3,
          );
        });
      },
    );
  }
}
