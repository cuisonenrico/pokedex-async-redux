import 'package:counter_async_redux/api/models/moves_model.dart';
import 'package:flutter/material.dart';

class MovesTab extends StatelessWidget {
  const MovesTab({required this.moves});
  final List<Moves>? moves;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
        ),
        itemCount: moves?.length,
        itemBuilder: ((context, index) => Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                height: 80,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Align(
                      alignment: Alignment.center,
                      child:
                          Text('${moves![index].move?.name?.toUpperCase()}')),
                ),
              ),
            )),
      ),
    );
  }
}
