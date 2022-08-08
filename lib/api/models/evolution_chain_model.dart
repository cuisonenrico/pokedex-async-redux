import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';

part 'evolution_chain_model.freezed.dart';
part 'evolution_chain_model.g.dart';

@freezed
class EvolutionChain with _$EvolutionChain {
  factory EvolutionChain({
    @JsonKey(name: 'evolution_one') Species? evolutionOne,
    @JsonKey(name: 'evolution_two') @Default(<Species>[]) List<Species> evolutionTwo,
    @JsonKey(name: 'evolution_three') @Default(<Species>[]) List<Species> evolutionThree,
  }) = _EvolutionChain;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => _$EvolutionChainFromJson(json);
}
