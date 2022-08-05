import 'package:pokedex_async_redux/api/api_client.dart';
import 'package:pokedex_async_redux/api/handlers/details_pokemon_handler.dart';
import 'package:pokedex_async_redux/api/handlers/evolution_handler.dart';
import 'package:pokedex_async_redux/api/handlers/pokemon_handler.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  ApiService._internal();

  final ApiClient _apiClient = ApiClient();

  PokemonHandler? _pokemonHandler;

  EvolutionHandler? _evolutionHandler;

  DetailsPokemonHandler? _detailsPokemonHandler;

  PokemonHandler get pokemonHandler => _pokemonHandler ??= PokemonHandler(_apiClient);

  EvolutionHandler get evolutionHandler => _evolutionHandler ??= EvolutionHandler(apiClient: _apiClient);

  DetailsPokemonHandler get detailsPokemonHandler =>
      _detailsPokemonHandler ??= DetailsPokemonHandler(apiClient: _apiClient);
}
