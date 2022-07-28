import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class PillContainerWidget extends StatelessWidget {
  const PillContainerWidget({
    required this.text,
    required this.color,
  });
  final String? text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2, 0, 3, 0),
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
          child: Text(
            (text ?? '').capitalize,
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
