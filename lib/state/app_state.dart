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
    @Default(Wait.empty) @JsonKey(ignore: true, name: 'wait') Wait wait,
    @JsonKey(name: 'pokemonDetails') DetailsPokemon? pokemonDetails,
    @JsonKey(name: 'evolution') EvolutionChain? evolution,
  }) = _AppState;

  factory AppState.init() => AppState(wait: Wait());

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
