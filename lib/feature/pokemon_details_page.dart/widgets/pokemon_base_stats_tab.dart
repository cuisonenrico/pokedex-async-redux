import 'package:pokedex_async_redux/api/models/stat_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/doubles.dart';

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
                      width: 150,
                      child: Text('${stat[index].stat?.name!.toUpperCase()}'),
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
                      color: Colors.black,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      value: (dblStat ?? 0.0) / statMax[index],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                      width: 30,
                      child: Text(
                        '${statMax[index].toInt()}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 23, 177, 156),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
