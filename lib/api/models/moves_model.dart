import 'package:pokedex_async_redux/api/models/move_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'moves_model.freezed.dart';
part 'moves_model.g.dart';

@freezed
class Moves with _$Moves {
  factory Moves({
    @JsonKey(name: 'move') Move? move,
  }) = _Moves;

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}
