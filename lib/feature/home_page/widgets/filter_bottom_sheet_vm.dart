import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/filter_bottom_sheet_connector.dart';
import 'package:pokedex_async_redux/state/actions/filter_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class FilterBottomSheetVmFactory extends VmFactory<AppState, FilterBottomSheetConnector> {
  @override
  Vm fromStore() => FilterBottomSheetVm(onFilterTap: _getFilteredList);

  void _getFilteredList(String filterType) => GetFilterListAction(filterKey: filterType);
}

class FilterBottomSheetVm extends Vm {
  FilterBottomSheetVm({required this.onFilterTap}) : super(equals: []);

  final Function(String filterType) onFilterTap;
}
