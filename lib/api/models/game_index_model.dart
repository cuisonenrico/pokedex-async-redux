import 'package:pokedex_async_redux/api/models/version_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_index_model.freezed.dart';
part 'game_index_model.g.dart';

@freezed
class GameIndex with _$GameIndex {
  factory GameIndex({
    int? gameIndex,
    Version? version,
  }) = _GameIndex;

  factory GameIndex.fromJson(Map<String, dynamic> json) => _$GameIndexFromJson(json);
}
