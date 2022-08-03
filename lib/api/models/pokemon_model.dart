import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    String? name,
    String? url,
    @Default(<SubType>[]) List<SubType>? types,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}
