import 'package:pokedex_async_redux/api/apI_service.dart';
import 'package:pokedex_async_redux/state/actions/actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utilities/app_starter.dart';

class GetFilterListAction extends LoadingAction {
  static const key = 'get_filtered_list_key';
  GetFilterListAction({required this.filterKey}) : super(actionKey: key);
  final String filterKey;
  @override
  Future<AppState> reduce() async {
    final filteredRes = await getIt<ApiService>().pokemonHandler.getFiltered(filterKey);
    return state.copyWith(
      filteredPokemons: filteredRes!,
      filterKey: filterKey,
    );
  }
}
