import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailedStat_model.freezed.dart';
part 'detailedStat_model.g.dart';

@freezed
class DetailedStat with _$DetailedStat {
  factory DetailedStat({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
  }) = _DetailedStat;

  factory DetailedStat.fromJson(Map<String, dynamic> json) =>
      _$DetailedStatFromJson(json);
}
