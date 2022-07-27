import 'package:pokedex_async_redux/api/models/moves_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/universal_functions.dart';

class MovesTab extends StatelessWidget {
  const MovesTab({
    required this.moves,
    required this.color,
  });
  final List<Moves>? moves;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: moves
              ?.map((e) => Padding(
                    padding: EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          capitalizeFirstLetter(e.move?.name ?? ''),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ))
              .toList() ??
          [],
    );
  }
}
