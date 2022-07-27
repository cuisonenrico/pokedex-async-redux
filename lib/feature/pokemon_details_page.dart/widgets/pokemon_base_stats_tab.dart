import 'package:pokedex_async_redux/api/models/stat_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/doubles.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class BaseStats extends StatelessWidget {
  const BaseStats({required this.stat});
  final List<Stat> stat;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: stat.length,
          itemBuilder: ((context, index) {
            var dblStat = stat[index].baseStat?.toDouble();
            return Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Container(
                      width: 80,
                      child: Text(
                        stat[index]
                                .stat
                                ?.name
                                ?.capitalize
                                .replaceAll('special-attack', 'Sp-Atk')
                                .replaceAll('special-defense', 'Sp-Def') ??
                            '',
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    child: Text('${stat[index].baseStat.toString()}'),
                  ),
                  Container(
                    width: 130,
                    margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    alignment: Alignment.topCenter,
                    child: LinearProgressIndicator(
                      color: Colors.orange,
                      backgroundColor: Color.fromARGB(97, 252, 213, 105),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                      value: (dblStat ?? 0.0) / statMax[index],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
