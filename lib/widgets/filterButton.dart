import 'package:flutter/material.dart';

class Filterbutton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  const Filterbutton(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.blue : Colors.grey),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            textAlign: TextAlign.center,
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
