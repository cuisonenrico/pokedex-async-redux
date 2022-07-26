import 'package:pokedex_async_redux/api/models/stat_model.dart';
import 'package:flutter/material.dart';

class BaseStats extends StatelessWidget {
  const BaseStats({required this.stat});
  final List<Stat>? stat;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: stat?.length,
          itemBuilder: ((context, index) => Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '${stat?[index].stat?.name!.toUpperCase()}: ${stat?[index].baseStat.toString()}'),
              )),
        ),
      ),
    );
  }
}
