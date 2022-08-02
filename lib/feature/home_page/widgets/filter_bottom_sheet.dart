import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/widgets/pill_container_widget.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({required this.onFilterTap});
  final Function(String typeFilter) onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: colorFilters
          .map((filter) => Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: GestureDetector(
                  onTap: () {
                    onFilterTap(filter);
                    Navigator.pop(context);
                  },
                  child: PillContainerWidget(
                    text: filter,
                    color: filter == 'clear' ? Colors.grey : filter.getPokemonColor,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
