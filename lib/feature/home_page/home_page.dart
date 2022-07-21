import 'package:counter_async_redux/api/models/detailsPokemon_model.dart';
import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:counter_async_redux/api/models/specificType_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.loadMore,
    required this.pokemon,
    this.next,
  });

  final VoidCallback loadMore;
  final List<DetailsPokemon>? pokemon;
  final String? next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Pokédex", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: Center(
                child: TextField(
                  onChanged: (query) async {},
                  showCursor: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          body: NotificationListener(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 240,
                childAspectRatio: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: pokemon?.length,
              itemBuilder: (context, index) {
                var boxColor = Colors.white;
                return Center(
                  child: GestureDetector(
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: boxColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(children: [
                        const SizedBox(height: 8),
                        Text(
                          '${pokemon?[index].name}',
                          style: const TextStyle(color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          children: [
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                                child: Text(
                                    '${pokemon![index].types![0].type!.name}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                                child: Visibility(
                                  visible: true,
                                  child: Center(
                                    child: Text(
                                        '${typeCheck(pokemon?[index].types!.last.type?.name, pokemon![index].types![0].type!.name) ?? ''}'),
                                  ),
                                ),
                              ),
                            ]),
                            Container(
                              width: 80,
                              height: 100,
                              alignment: Alignment.centerRight,
                              child: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon?[index].id}.png', // this image doesn't exist
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.amber,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: loadMore,
            tooltip: 'Increment',
            child: const Icon(Icons.circle),
          ),
        ));
  }
}

typeCheck(String? name, String? name2) {
  if (name != name2) {
    return name;
  } else {
    return '';
  }
}
