import 'package:pokedex_async_redux/api/models/detailed_stat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_model.freezed.dart';
part 'stat_model.g.dart';

@freezed
class Stat with _$Stat {
  factory Stat({
    @JsonKey(name: 'base_stat') int? baseStat,
    @JsonKey(name: 'effort') int? effort,
    @JsonKey(name: 'stat') DetailedStat? stat,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}
