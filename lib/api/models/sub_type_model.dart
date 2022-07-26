import 'package:pokedex_async_redux/api/models/specific_type_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_type_model.freezed.dart';
part 'sub_type_model.g.dart';

@freezed
class SubType with _$SubType {
  factory SubType({
    @JsonKey(name: 'slot') int? slot,
    @JsonKey(name: 'type') SpecificType? type,
  }) = _SubType;

  factory SubType.fromJson(Map<String, dynamic> json) => _$SubTypeFromJson(json);
}
