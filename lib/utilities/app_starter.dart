import 'package:async_redux/async_redux.dart';
import 'package:counter_async_redux/pokedex_app.dart';
import 'package:counter_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

void appStarter() {
  WidgetsFlutterBinding.ensureInitialized();

  final store = Store<AppState>(
    initialState: AppState.init(),
    actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
  );

  runApp(PokedexApp(store: store));
}
