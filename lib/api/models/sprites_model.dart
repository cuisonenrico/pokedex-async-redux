import 'package:freezed_annotation/freezed_annotation.dart';

part 'sprites_model.freezed.dart';
part 'sprites_model.g.dart';

@freezed
class Sprites with _$Sprites {
  factory Sprites({
    @JsonKey(name: 'backDefault') String? backDefault,
    @JsonKey(name: 'backShiny') String? backShiny,
    @JsonKey(name: 'frontDefault') String? frontDefault,
    @JsonKey(name: 'frontShiny') String? frontShiny,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
}
