import 'package:freezed_annotation/freezed_annotation.dart';

part 'specific_type_model.freezed.dart';
part 'specific_type_model.g.dart';

@freezed
class SpecificType with _$SpecificType {
  factory SpecificType({
    String? name,
    String? url,
  }) = _SpecificType;

  factory SpecificType.fromJson(Map<String, dynamic> json) => _$SpecificTypeFromJson(json);
}
