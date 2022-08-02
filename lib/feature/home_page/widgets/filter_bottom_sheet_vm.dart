import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/filter_bottom_sheet_connector.dart';
import 'package:pokedex_async_redux/models/union_page_state.dart';
import 'package:pokedex_async_redux/state/actions/home_page_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class FilterBottomSheetVmFactory extends VmFactory<AppState, FilterBottomSheetConnector> {
  @override
  Vm fromStore() => FilterBottomSheetVm(onFilterTapState: _onFilterTapState());

  UnionPageState<Function(String filterType)> _onFilterTapState() {
    if (state.wait.isWaitingFor(GetFilterList.key)) {
      return UnionPageState.loading();
    } else if (state.pokemon.isNotEmpty) {
      return UnionPageState(_getFilteredList);
    } else {
      return UnionPageState.error("Can't load filtered");
    }
  }

  void _getFilteredList(String filterType) =>
      dispatch(filterType == 'clear' ? GetPokemonList() : GetFilterList(filterKey: filterType));
}

class FilterBottomSheetVm extends Vm {
  FilterBottomSheetVm({required this.onFilterTapState}) : super(equals: []);

  final UnionPageState<Function(String filterType)> onFilterTapState;
}
