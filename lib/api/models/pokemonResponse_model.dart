import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemonResponse_model.freezed.dart';
part 'pokemonResponse_model.g.dart';

@freezed
class PokemonResponse with _$PokemonResponse {
  factory PokemonResponse({
    @JsonKey(name: 'result') List<Pokemon>? result,
    @JsonKey(name: 'next') String? next,
  }) = _PokemonResponse;

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);
}
