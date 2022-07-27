import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

String capitalizeFirstLetter(String name) {
  if (name != '') {
    return '${name[0].toUpperCase()}${name.substring(1)}';
  } else {
    return '';
  }
}

Color getPokemonColor(String type) {
  switch (type) {
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
    case 'typeDetailsPage':
      return Color.fromARGB(99, 255, 255, 255);
    default:
      return Colors.white;
  }
}
