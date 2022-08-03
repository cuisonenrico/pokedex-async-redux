import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/home_page/widgets/pokemon_filtered_connector.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({required this.onFilterTap});
  final Function(String typeFilter) onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
          child: Icon(
            Icons.remove,
            size: 30,
          ),
        ),
        Flexible(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 30,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: colorFilters.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PokemonFilteredPageConnector(filterKey: colorFilters[index]))),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorFilters[index].getPokemonColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      bottom: 5,
                      child: Text(
                        colorFilters[index].capitalize,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
