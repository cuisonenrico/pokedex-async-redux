import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex_async_redux/utilities/doubles.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class PokemonListLoading extends StatelessWidget {
  const PokemonListLoading();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          titleHeader,
          style: TextStyle(
            color: Colors.black,
            fontSize: headerSize,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Scaffold(
        body: Center(child: SpinKitDualRing(color: Colors.black)),
      ),
    );
  }
}
