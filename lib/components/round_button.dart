import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  
  RoundButton({required this.icon, required this.onPressed,});

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      elevation: 6.0,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed,
    );
  }
}