import 'package:counter_async_redux/api/models/detailsPokemon_model.dart';
import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:counter_async_redux/api/models/specificType_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @JsonKey(name: 'pokemon') List<DetailsPokemon>? pokemon,
    @Default('0') @JsonKey(name: 'nextPage') String? nextPage,
  }) = _AppState;

  factory AppState.init() => AppState(
        pokemon: List.empty(),
      );

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
