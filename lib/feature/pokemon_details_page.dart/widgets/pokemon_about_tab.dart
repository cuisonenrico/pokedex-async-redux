import 'package:pokedex_async_redux/api/models/ability_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    required this.height,
    required this.weight,
    required this.abilities,
    required this.baseExperience,
  });
  final int height;
  final int weight;
  final List<Ability>? abilities;
  final int baseExperience;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Container(
                    width: 150,
                    child: Text(
                      'Height',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: aboutTextColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text('${height / 10} m'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Container(
                    width: 150,
                    child: Text(
                      'Weight',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: aboutTextColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text('${weight / 10} kg'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Container(
                    width: 150,
                    child: Text(
                      'Abilities',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: aboutTextColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child:
                      Wrap(children: abilities!.map((e) => Text('${(e.ability?.name ?? '').capitalize}, ')).toList()),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Container(
                    width: 150,
                    child: Text(
                      'Base Experience ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: aboutTextColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text('$baseExperience'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
