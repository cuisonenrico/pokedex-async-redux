import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({
    required this.type,
  });
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2, 0, 3, 0),
      child: Container(
        decoration: BoxDecoration(
          color: bgTypeDetailsPage,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
          child: Text(
            type.capitalize,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
