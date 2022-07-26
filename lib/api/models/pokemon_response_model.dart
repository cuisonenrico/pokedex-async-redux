import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';

part 'pokemon_response_model.freezed.dart';
part 'pokemon_response_model.g.dart';

@freezed
class PokemonResponse with _$PokemonResponse {
  factory PokemonResponse({
    @JsonKey(name: 'result') List<Pokemon>? result,
    @JsonKey(name: 'next') String? next,
    @Default(<SubType>[]) @JsonKey(name: 'types') List<SubType>? types,
  }) = _PokemonResponse;

  factory PokemonResponse.fromJson(Map<String, dynamic> json) => _$PokemonResponseFromJson(json);
}
