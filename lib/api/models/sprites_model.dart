import 'package:freezed_annotation/freezed_annotation.dart';

part 'sprites_model.freezed.dart';
part 'sprites_model.g.dart';

@freezed
class Sprites with _$Sprites {
  factory Sprites({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
}
