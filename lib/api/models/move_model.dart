import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_model.freezed.dart';
part 'move_model.g.dart';

@freezed
class Move with _$Move {
  factory Move({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
