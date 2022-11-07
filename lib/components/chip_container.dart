import 'package:flutter/material.dart';

class ChipContainer extends StatelessWidget {
  final Color color;
  final String text;
  const ChipContainer({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
          child: Text(text),
        ),
      ),
    );
  }
}
