import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability_model.freezed.dart';
part 'ability_model.g.dart';

@freezed
class Ability with _$Ability {
  factory Ability({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}
