import 'package:pokedex_async_redux/api/api_client.dart';
import 'package:pokedex_async_redux/api/models/evolution_chain_model.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';

class EvolutionHandler {
  EvolutionHandler({required this.apiClient});
  final ApiClient apiClient;
  Future<EvolutionChain?> getEvolution(String? url) async {
    return apiClient.dio.getUri(Uri.tryParse(url ?? '') ?? Uri()).then(
          (response) => apiClient.dio
              .getUri(Uri.tryParse(response.data['evolution_chain']['url']) ?? Uri())
              .then((evoChainResponse) {
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
                      id: species['species']['url'].split('/')[6],
                    ));
                  }
                }
              }
            }
            return EvolutionChain(
              evolutionOne: Species(
                name: listEvolution.data['chain']['species']['name'],
                id: listEvolution.data['chain']['species']['url'].toString().split('/')[6],
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
          }),
        );
  }
}
