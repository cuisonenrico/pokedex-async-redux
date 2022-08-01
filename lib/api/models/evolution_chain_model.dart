import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';

part 'evolution_chain_model.freezed.dart';
part 'evolution_chain_model.g.dart';

@freezed
class EvolutionChain with _$EvolutionChain {
  factory EvolutionChain({
    @JsonKey(name: 'evolutionOne') Species? evolutionOne,
    @Default(<Species>[]) @JsonKey(name: 'evolutionTwo') List<Species> evolutionTwo,
    @JsonKey(name: 'evolutionThree') Species? evolutionThree,
  }) = _EvolutionChain;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => _$EvolutionChainFromJson(json);
}
