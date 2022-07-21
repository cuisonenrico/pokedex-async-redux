import 'package:counter_async_redux/api/models/version_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gameIndex_model.freezed.dart';
part 'gameIndex_model.g.dart';

@freezed
class GameIndex with _$GameIndex {
  factory GameIndex({
    @JsonKey(name: 'game_index') int? game_index,
    @JsonKey(name: 'version') Version? version,
  }) = _GameIndex;

  factory GameIndex.fromJson(Map<String, dynamic> json) =>
      _$GameIndexFromJson(json);
}
