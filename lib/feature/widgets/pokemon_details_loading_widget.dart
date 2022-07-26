import 'package:flutter/material.dart';

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
      body: (Center(child: CircularProgressIndicator())),
    );
  }
}
