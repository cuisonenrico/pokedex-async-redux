import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/filter_bottom_sheet.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/filter_bottom_sheet_vm.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

class FilterBottomSheetConnector extends StatelessWidget {
  const FilterBottomSheetConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FilterBottomSheetVm>(
        vm: () => FilterBottomSheetVmFactory(),
        builder: (context, vm) => FilterBottomSheet(onFilterTap: vm.onFilterTap));
  }
}
