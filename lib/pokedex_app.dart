import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/feature/home_page/home_page_connector.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({
    required this.store,
    Key? key,
  }) : super(key: key);

  final Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePageConnector(),
      ),
    );
  }
}
