import 'package:pokedex_async_redux/api/models/ability_model.dart';
import 'package:flutter/material.dart';

class Abilities extends StatelessWidget {
  const Abilities({required this.abilities});
  final List<Ability>? abilities;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: abilities?.length,
          itemBuilder: ((context, index) => Align(
                alignment: Alignment.centerLeft,
                child: Text(abilities?[index].ability?.name?.toUpperCase() ?? ''),
              )),
        ),
      ),
    );
  }
}
