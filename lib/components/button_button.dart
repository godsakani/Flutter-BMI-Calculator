import 'package:flutter/material.dart';

import '../constant.dart';

class BottomButton extends StatelessWidget {
   
   BottomButton({ required this.onTap,  required this.buttonTitle });

  final VoidCallback onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
         margin:const EdgeInsets.all(20.0),
          height: kBottomContainerHeight,
          width: double.infinity,
          child: Center(
            child:Text(
              buttonTitle,
              style: kLargeButtonTextStyle,
              ),
          ),
        decoration: BoxDecoration(
           color: kBottomColor,
          borderRadius: BorderRadius.circular(5.0)
        ),
        ),
    );
  }
}

