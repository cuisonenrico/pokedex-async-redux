import 'package:pokedex_async_redux/api/models/specific_ability_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability_model.freezed.dart';
part 'ability_model.g.dart';

@freezed
class Ability with _$Ability {
  factory Ability({
    SpecificAbility? ability,
    bool? isHidden,
    int? slot,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}
