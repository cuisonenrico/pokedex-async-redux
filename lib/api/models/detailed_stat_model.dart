import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_stat_model.freezed.dart';
part 'detailed_stat_model.g.dart';

@freezed
class DetailedStat with _$DetailedStat {
  factory DetailedStat({
    String? name,
    String? url,
  }) = _DetailedStat;

  factory DetailedStat.fromJson(Map<String, dynamic> json) => _$DetailedStatFromJson(json);
}
