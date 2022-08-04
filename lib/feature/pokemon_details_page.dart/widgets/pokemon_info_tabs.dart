import 'package:flutter/material.dart';

class PokemonInfoTabs extends StatelessWidget {
  const PokemonInfoTabs({
    required this.tabTitle,
    Key? key,
  }) : super(key: key);
  final String tabTitle;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          tabTitle,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
