import 'package:freezed_annotation/freezed_annotation.dart';

part 'specific_type_model.freezed.dart';
part 'specific_type_model.g.dart';

@freezed
class SpecificType with _$SpecificType {
  factory SpecificType({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
  }) = _SpecificType;

  factory SpecificType.fromJson(Map<String, dynamic> json) => _$SpecificTypeFromJson(json);
}
