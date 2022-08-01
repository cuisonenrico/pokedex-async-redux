import 'package:flutter/material.dart';

class PokemonInfoTabs extends StatelessWidget {
  const PokemonInfoTabs({
    required this.tab,
  });
  final String tab;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          tab,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
