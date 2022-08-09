import 'package:pokedex_async_redux/api/api_client.dart';
import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class DetailsPokemonHandler {
  DetailsPokemonHandler({required this.apiClient});
  final ApiClient apiClient;

  Future<DetailsPokemon?> getDetails(String id) async {
    final baseUri = Uri.parse(apiClient.dio.options.baseUrl);
    final uri = baseUri.replace(path: '${baseUri.path}$pokemonsPath$id');
    return apiClient.dio.getUri(uri).then((response) => DetailsPokemon.fromJson(response.data));
  }
}
