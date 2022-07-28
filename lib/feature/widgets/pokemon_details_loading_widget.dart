import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PokemonDetailsLoading extends StatelessWidget {
  const PokemonDetailsLoading();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(child: SpinKitDualRing(color: Colors.black)),
    );
  }
}
