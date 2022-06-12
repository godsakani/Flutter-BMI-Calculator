import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
   
  ReusableCard({required this.colour,required this.cardChild, });


  final Color colour;
  final Widget cardChild;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(20.0),
      height: 110,
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}