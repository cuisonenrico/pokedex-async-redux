import 'package:freezed_annotation/freezed_annotation.dart';

part 'union_page_state.freezed.dart';

@freezed
class UnionPageState<T> with _$UnionPageState<T> {
  const factory UnionPageState([T? value]) = Data<T>;

  const factory UnionPageState.loading() = Loading<T>;

  const factory UnionPageState.error([String? message]) = Error<T>;
}
