import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_model.freezed.dart';
part 'version_model.g.dart';

@freezed
class Version with _$Version {
  factory Version({
    String? name,
    String? url,
  }) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
}
