import 'package:freezed_annotation/freezed_annotation.dart';

part 'sprites_model.freezed.dart';
part 'sprites_model.g.dart';

@freezed
class Sprites with _$Sprites {
  factory Sprites({
    @JsonKey(name: 'back_default') String? back_default,
    @JsonKey(name: 'back_shiny') String? back_shiny,
    @JsonKey(name: 'front_default') String? front_default,
    @JsonKey(name: 'front_shiny') String? front_shiny,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}
