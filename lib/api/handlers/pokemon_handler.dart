import 'package:pokedex_async_redux/api/api_client.dart';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class PokemonHandler {
  PokemonHandler(this.apiClient);
  final ApiClient apiClient;
  Future<List<Pokemon>?> getPokemons() async {
    final queryParams = <String, dynamic>{};
    queryParams['limit'] = '10000';
    final baseUri = Uri.parse(apiClient.dio.options.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}$pokemonsPath');
    return apiClient.dio
        .getUri(uri)
        .then((pokemonMap) => pokemonMap.data['results'].map<Pokemon>((e) => Pokemon.fromJson(e)).toList());
  }

  Future<List<Pokemon>?> getFiltered(String filterKey) async {
    final queryParams = <String, dynamic>{};
    final baseUri = Uri.parse(apiClient.dio.options.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}$pokemonsTypePath$filterKey');
    return apiClient.dio
        .getUri(uri)
        .then((typeMap) => typeMap.data['pokemon'].map<Pokemon>((e) => Pokemon.fromJson(e['pokemon'])).toList());
  }
}
