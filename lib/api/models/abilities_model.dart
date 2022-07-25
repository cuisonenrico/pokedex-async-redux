import 'package:pokedex_async_redux/api/models/ability_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'abilities_model.freezed.dart';
part 'abilities_model.g.dart';

@freezed
class Abilities with _$Abilities {
  factory Abilities({
    @JsonKey(name: 'ability') Ability? ability,
    @JsonKey(name: 'is_hidden') bool? isHidden,
    @JsonKey(name: 'slot') int? slot,
  }) = _Abilities;

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);
}
