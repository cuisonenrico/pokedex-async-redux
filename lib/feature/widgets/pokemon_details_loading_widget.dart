import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PokemonDetailsLoading extends StatelessWidget {
  const PokemonDetailsLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(child: SpinKitDualRing(color: Colors.black)),
    );
  }
}
