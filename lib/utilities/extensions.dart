import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

extension StringExt on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
  Color get getPokemonColor {
    switch (this) {
      case 'fire':
        return kFire;
      case 'bug':
        return kBug;
      case 'dark':
        return kDark;
      case 'electric':
        return kElectric;
      case 'fairy':
        return kFairy;
      case 'fighting':
        return kFighting;
      case 'dragon':
        return kDragon;
      case 'flying':
        return kFlying;
      case 'ghost':
        return kGhost;
      case 'grass':
        return kGrass;
      case 'ground':
        return kGround;
      case 'ice':
        return kIce;
      case 'normal':
        return kNormal;
      case 'poison':
        return kPoison;
      case 'psychic':
        return kPsychic;
      case 'rock':
        return kRock;
      case 'steel':
        return kSteel;
      case 'water':
        return kWater;
      default:
        return Colors.white;
    }
  }
}
