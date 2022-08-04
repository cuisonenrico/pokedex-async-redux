import 'package:pokedex_async_redux/api/models/moves_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/widgets/pill_container_widget.dart';

class MovesTab extends StatelessWidget {
  const MovesTab({
    required this.moves,
    required this.color,
    Key? key,
  }) : super(key: key);
  final List<Moves>? moves;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Wrap(
          children: moves
                  ?.map((e) => Padding(
                        padding: const EdgeInsets.all(2),
                        child: PillContainerWidget(
                          text: e.move!.name!,
                          color: color,
                        ),
                      ))
                  .toList() ??
              [],
        ),
      ),
    );
  }
}
