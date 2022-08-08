import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:pokedex_async_redux/api/models/evolution_chain_model.dart';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(<Pokemon>[]) @JsonKey(name: 'pokemon') List<Pokemon> pokemon,
    @JsonKey(name: 'pokemonDetails') DetailsPokemon? pokemonDetails,
    @JsonKey(name: 'evolution') EvolutionChain? evolution,
    @Default(<Pokemon>[]) @JsonKey(name: 'filteredPokemons') List<Pokemon> filteredPokemons,
    @Default('') @JsonKey(name: 'filterKey') String filterKey,
    @Default(Wait.empty) @JsonKey(name: 'wait', ignore: true) Wait wait,
  }) = _AppState;

  factory AppState.init() => AppState(wait: Wait());

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
