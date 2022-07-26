import 'package:freezed_annotation/freezed_annotation.dart';

part 'species_model.freezed.dart';
part 'species_model.g.dart';

@freezed
class Species with _$Species {
  factory Species({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
  }) = _Species;

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);
}
