import 'package:freezed_annotation/freezed_annotation.dart';

part 'specific_ability_model.freezed.dart';
part 'specific_ability_model.g.dart';

@freezed
class SpecificAbility with _$SpecificAbility {
  factory SpecificAbility({
     @JsonKey(name: 'url')String? url,
     @JsonKey(name: 'name')String? name,
  }) = _SpecificAbility;

  factory SpecificAbility.fromJson(Map<String, dynamic> json) => _$SpecificAbilityFromJson(json);
}
